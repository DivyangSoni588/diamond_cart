import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';

abstract class DiamondState {}

class DiamondInitial extends DiamondState {}

class DiamondLoading extends DiamondState {}

class DiamondLoaded extends DiamondState {
  final List<Diamonds> diamonds;

  DiamondLoaded(this.diamonds);
}

class DiamondError extends DiamondState {
  final String message;

  DiamondError(this.message);
}
