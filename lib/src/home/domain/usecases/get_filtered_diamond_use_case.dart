import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_filter_entity.dart';
import 'package:diamond_cart/src/home/domain/repositories/diamond_repository.dart';

class GetFilteredDiamondUseCase {
  final DiamondRepository repository;

  GetFilteredDiamondUseCase(this.repository);

  Future<List<Diamonds>> execute(
    DiamondFilterEntity diamondFilterEntity,
  ) async {
    return await repository.getDiamondsByFilter(
      diamondFilterEntity: diamondFilterEntity,
    );
  }
}
