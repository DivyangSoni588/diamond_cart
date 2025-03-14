import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';

abstract class DiamondDataSource {
  Future<DiamondData> getDiamondData();
}
