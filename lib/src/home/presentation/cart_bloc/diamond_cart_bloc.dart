import 'package:diamond_cart/src/home/domain/usecases/add_to_cart_usecase.dart';
import 'package:diamond_cart/src/home/domain/usecases/get_cart_diamonds.dart';
import 'package:diamond_cart/src/home/domain/usecases/remove_from_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'diamond_cart_event.dart';
import 'diamond_cart_state.dart';

class DiamondCartBloc extends Bloc<DiamondCartEvent, DiamondCartState> {
  final AddToCartUseCase addToCartUseCase =
      GetIt.instance.get<AddToCartUseCase>();
  final RemoveFromCartUseCase removeFromCartUseCase =
      GetIt.instance.get<RemoveFromCartUseCase>();
  final GetCartDiamonds getCartDiamonds = GetIt.instance.get<GetCartDiamonds>();

  DiamondCartBloc() : super(DiamondCartInitial()) {
    on<LoadCartEvent>(_onLoadCart);
    on<AddDiamondToCartEvent>(_onAddDiamondToCart);
    on<RemoveDiamondFromCartEvent>(_onRemoveDiamondFromCart);
  }

  Future<void> _onLoadCart(
    LoadCartEvent event,
    Emitter<DiamondCartState> emit,
  ) async {
    emit(DiamondCartLoading());
    try {
      final diamonds = await getCartDiamonds.execute(null);
      emit(DiamondCartLoaded(diamonds));
    } catch (e) {
      emit(DiamondCartError(e.toString()));
    }
  }

  Future<void> _onAddDiamondToCart(
    AddDiamondToCartEvent event,
    Emitter<DiamondCartState> emit,
  ) async {
    try {
      await addToCartUseCase.execute(event.diamond);
      emit(DiamondAddedToCart());

      // Refresh the cart after adding
      final diamonds = await getCartDiamonds.execute(null);
      emit(DiamondCartLoaded(diamonds));
    } catch (e) {
      emit(DiamondCartError(e.toString()));
    }
  }

  Future<void> _onRemoveDiamondFromCart(
    RemoveDiamondFromCartEvent event,
    Emitter<DiamondCartState> emit,
  ) async {
    try {
      await removeFromCartUseCase.execute(event.lotId);
      emit(DiamondRemovedFromCart());

      // Refresh the cart after removal
      final diamonds = await getCartDiamonds.execute(null);
      emit(DiamondCartLoaded(diamonds));
    } catch (e) {
      emit(DiamondCartError(e.toString()));
    }
  }
}
