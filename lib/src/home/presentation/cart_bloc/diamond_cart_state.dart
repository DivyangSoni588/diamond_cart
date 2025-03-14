import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:equatable/equatable.dart';

abstract class DiamondCartState extends Equatable {
  const DiamondCartState();

  @override
  List<Object?> get props => [];
}

class DiamondCartInitial extends DiamondCartState {}

class DiamondCartLoading extends DiamondCartState {}

class DiamondCartLoaded extends DiamondCartState {
  final List<Diamonds> diamonds;

  const DiamondCartLoaded(this.diamonds);

  @override
  List<Object?> get props => [diamonds];
}

class DiamondCartError extends DiamondCartState {
  final String message;

  const DiamondCartError(this.message);

  @override
  List<Object?> get props => [message];
}

class DiamondAddedToCart extends DiamondCartState {}

class DiamondRemovedFromCart extends DiamondCartState {}
