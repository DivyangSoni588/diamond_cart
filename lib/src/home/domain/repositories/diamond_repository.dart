import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_filter_entity.dart';

abstract class DiamondRepository {
  Future<List<Diamonds>> getAllDiamonds();

  Future<List<Diamonds>> getDiamondsByFilter({
    DiamondFilterEntity? diamondFilterEntity,
  });
}
