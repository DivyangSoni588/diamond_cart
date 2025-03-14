import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/repositories/diamond_repository.dart';

class AddToCartUseCase {
  final DiamondRepository repository;

  AddToCartUseCase(this.repository);

  Future<void> execute(Diamonds? diamond) async {
    return repository.addDiamondToCart(diamonds: diamond);
  }
}
