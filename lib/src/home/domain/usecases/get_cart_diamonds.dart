import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/repositories/diamond_repository.dart';

class GetCartDiamonds {
  final DiamondRepository repository;

  GetCartDiamonds(this.repository);

  Future<List<Diamonds>> execute(String? lotId) async {
    return repository.getAllDiamonds();
  }
}
