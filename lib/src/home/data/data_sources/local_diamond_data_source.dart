import 'package:diamond_cart/data/sources/data.dart';
import 'package:diamond_cart/src/home/data/data_sources/diamond_data_source.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';

class LocalDiamondDataSource implements DiamondDataSource {
  DiamondData? _diamondData;

  @override
  Future<DiamondData> getDiamondData() async {
    _diamondData ??= DiamondData.fromJson(diamondData);
    return _diamondData!;
  }
}
