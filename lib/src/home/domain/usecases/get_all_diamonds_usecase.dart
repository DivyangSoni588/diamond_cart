import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/repositories/diamond_repository.dart';

class GetAllDiamondsUseCase {
  final DiamondRepository repository;

  GetAllDiamondsUseCase(this.repository);

  Future<List<Diamonds>> execute() async {
    return await repository.getAllDiamonds();
  }
}
