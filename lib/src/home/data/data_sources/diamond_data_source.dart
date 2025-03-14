import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_filter_entity.dart';

abstract class DiamondDataSource {
  Future<DiamondData> getDiamondData();
  Future<DiamondData> getFilteredDiamondData({
    DiamondFilterEntity? diamondFilterEntity,
  });

  Future<DiamondData> getAddedToCartDiamondData();

  Future<void> removeDiamondFromCart({String? lotId});

  Future<void> addDiamondToCart({Diamonds diamond});
}
