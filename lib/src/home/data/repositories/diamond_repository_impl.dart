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
    if (diamonds != null) {
      dataSource.addDiamondToCart(diamond: diamonds);
    }
    return Future.value();
  }

  @override
  Future<List<Diamonds>> getAllDiamondsAddedToCart() async {
    final diamondData = await dataSource.getAddedToCartDiamondData();
    return diamondData.diamonds ?? [];
  }

  @override
  Future<void> removeDiamondFromCart({String? lotId}) {
    if (lotId != null) {
      dataSource.removeDiamondFromCart(lotId: lotId);
    }
    return Future.value();
  }
}
