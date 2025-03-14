import 'package:diamond_cart/src/home/data/data_sources/diamond_data_source.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_filter_entity.dart';
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
    DiamondFilterEntity? diamondFilterEntity,
  }) async {
    final diamondData = await dataSource.getFilteredDiamondData(
      diamondFilterEntity: diamondFilterEntity,
    );
    return diamondData.diamonds ?? [];
  }

  @override
  Future<void> addDiamondToCart({Diamonds? diamonds}) {
    // TODO: implement addDiamondToCart
    throw UnimplementedError();
  }

  @override
  Future<void> getAllDiamondsAddedToCart() {
    // TODO: implement getAllDiamondsAddedToCart
    throw UnimplementedError();
  }

  @override
  Future<void> removeDiamondFromCart({String? lotId}) {
    // TODO: implement removeDiamondFromCart
    throw UnimplementedError();
  }
}
