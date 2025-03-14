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
    return _diamondData!;
  }

  @override
  Future<DiamondData> getFilteredDiamondData({
    DiamondFilterEntity? diamondFilterEntity,
  }) async {
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
      HiveManager.addToCart(DiamondMapper.toHive(diamond));
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
}
