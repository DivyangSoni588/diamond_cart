import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';

abstract class DiamondRepository {
  Future<List<Diamonds>> getAllDiamonds();

  Future<List<Diamonds>> getDiamondsByFilter({
    String? shape,
    String? color,
    String? clarity,
    String? cut,
    double? minCarat,
    double? maxCarat,
  });
}
