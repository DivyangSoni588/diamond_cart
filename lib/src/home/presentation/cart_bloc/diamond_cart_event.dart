import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:equatable/equatable.dart';

abstract class DiamondCartEvent extends Equatable {
  const DiamondCartEvent();

  @override
  List<Object?> get props => [];
}

class LoadCartEvent extends DiamondCartEvent {}

class AddDiamondToCartEvent extends DiamondCartEvent {
  final Diamonds diamond;

  const AddDiamondToCartEvent(this.diamond);

  @override
  List<Object?> get props => [diamond];
}

class RemoveDiamondFromCartEvent extends DiamondCartEvent {
  final String lotId;

  const RemoveDiamondFromCartEvent(this.lotId);

  @override
  List<Object?> get props => [lotId];
}
