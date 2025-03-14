import 'package:diamond_cart/core/local_storage/hive_manager.dart';
import 'package:diamond_cart/data/sources/data.dart';
import 'package:diamond_cart/src/home/data/data_sources/diamond_data_source.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_filter_entity.dart';
import 'package:diamond_cart/src/home/domain/mappers/diamond_mapper.dart';

class LocalDiamondDataSource implements DiamondDataSource {
  DiamondData? _diamondData;

  @override
  Future<DiamondData> getDiamondData() async {
    _diamondData ??= DiamondData.fromJson(diamondData);

    await updateDiamondData();

    return _diamondData!;
  }

  @override
  Future<DiamondData> getFilteredDiamondData({
    DiamondFilterEntity? diamondFilterEntity,
  }) async {
    await updateDiamondData();

    final allDiamonds = _diamondData;

    final filteredDiamonds =
        allDiamonds?.diamonds?.where((diamond) {
          if (diamondFilterEntity == null) return true;

          if (diamondFilterEntity.selectedShape != null &&
              diamond.shape != diamondFilterEntity.selectedShape) {
            return false;
          }
          if (diamondFilterEntity.selectedColor != null &&
              diamond.color != diamondFilterEntity.selectedColor) {
            return false;
          }
          if (diamondFilterEntity.selectedLab != null &&
              diamond.lab != diamondFilterEntity.selectedLab) {
            return false;
          }
          if (diamondFilterEntity.selectedClarities.isNotEmpty &&
              !diamondFilterEntity.selectedClarities.contains(
                diamond.clarity,
              )) {
            return false;
          }
          if (diamondFilterEntity.minCarat > 0 &&
              (diamond.carat ?? 0.0) < diamondFilterEntity.minCarat) {
            return false;
          }
          if (diamondFilterEntity.maxCarat > 0 &&
              (diamond.carat ?? 0.0) > diamondFilterEntity.maxCarat) {
            return false;
          }

          return true;
        }).toList();

    return DiamondData(diamonds: filteredDiamonds ?? []);
  }

  @override
  Future<void> addDiamondToCart({Diamonds? diamond}) {
    if (diamond != null) {
      HiveManager.addToCart(
        DiamondMapper.toHive(diamond.copyWith(addedToCart: true)),
      );
    }
    return Future.value();
  }

  @override
  Future<DiamondData> getAddedToCartDiamondData() async {
    final diamonds = HiveManager.getCartItems();
    final diamondData =
        diamonds.map((diamond) => DiamondMapper.fromHive(diamond)).toList();
    return DiamondData(diamonds: diamondData);
  }

  @override
  Future<void> removeDiamondFromCart({String? lotId}) {
    if (lotId != null) {
      HiveManager.removeFromCart(lotId);
    }
    return Future.value();
  }

  Future<void> updateDiamondData() async {
    final alreadyAddedToCartDiamonds = await getAddedToCartDiamondData();

    final updatedDiamonds =
        _diamondData?.diamonds?.map((diamond) {
          // Check if the current diamond is already in the cart
          final isAlreadyInCart =
              alreadyAddedToCartDiamonds.diamonds?.any(
                (cartDiamond) => cartDiamond.lotID == diamond.lotID,
              ) ??
              false;

          return Diamonds(
            qty: diamond.qty,
            lotID: diamond.lotID,
            size: diamond.size,
            carat: diamond.carat,
            lab: diamond.lab,
            shape: diamond.shape,
            color: diamond.color,
            clarity: diamond.clarity,
            cut: diamond.cut,
            polish: diamond.polish,
            symmetry: diamond.symmetry,
            fluorescence: diamond.fluorescence,
            discount: diamond.discount,
            perCaratRate: diamond.perCaratRate,
            finalAmount: diamond.finalAmount,
            keyToSymbol: diamond.keyToSymbol,
            labComment: diamond.labComment,
            addedToCart: isAlreadyInCart, // ✅ Set true if found in the cart
          );
        }).toList() ??
        [];

    _diamondData = DiamondData(diamonds: updatedDiamonds);
  }
}
