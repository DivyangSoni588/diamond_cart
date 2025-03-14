import 'package:diamond_cart/src/home/domain/repositories/diamond_repository.dart';

class RemoveFromCartUseCase {
  final DiamondRepository repository;

  RemoveFromCartUseCase(this.repository);

  Future<void> execute(String? lotId) async {
    repository.removeDiamondFromCart(lotId: lotId);
  }
}
