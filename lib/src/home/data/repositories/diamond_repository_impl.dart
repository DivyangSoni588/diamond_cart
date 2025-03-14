import 'package:diamond_cart/src/home/data/data_sources/diamond_data_source.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/repositories/diamond_repository.dart';

class DiamondRepositoryImpl implements DiamondRepository {
  final DiamondDataSource dataSource;

  DiamondRepositoryImpl(this.dataSource);

  @override
  Future<List<Diamonds>> getAllDiamonds() async {
    final diamondData = await dataSource.getDiamondData();
    return diamondData.diamonds ?? [];
  }

  @override
  Future<List<Diamonds>> getDiamondsByFilter({
    String? shape,
    String? color,
    String? clarity,
    String? cut,
    double? minCarat,
    double? maxCarat,
  }) {
    // TODO: implement getDiamondsByFilter
    throw UnimplementedError();
  }
}
