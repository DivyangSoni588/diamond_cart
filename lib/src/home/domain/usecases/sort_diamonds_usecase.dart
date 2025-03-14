import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/repositories/diamond_repository.dart';

class SortDiamondsUseCase {
  final DiamondRepository repository;

  SortDiamondsUseCase(this.repository);

  List<Diamonds> execute(List<Diamonds> diamonds, String sortOption) {
    List<Diamonds> sortedDiamonds = List.from(diamonds);

    switch (sortOption) {
      case 'Final Price (Asc)':
        sortedDiamonds.sort((a, b) => (a.finalAmount ?? 0).compareTo(b.finalAmount ?? 0));
        break;
      case 'Final Price (Desc)':
        sortedDiamonds.sort((a, b) => (b.finalAmount ?? 0).compareTo(a.finalAmount ?? 0));
        break;
      case 'Carat Weight (Asc)':
        sortedDiamonds.sort((a, b) => (a.carat ?? 0).compareTo(b.carat ?? 0));
        break;
      case 'Carat Weight (Desc)':
        sortedDiamonds.sort((a, b) => (b.carat ?? 0).compareTo(a.carat ?? 0));
        break;
    }

    return sortedDiamonds;
  }
}
