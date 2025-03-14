import 'package:diamond_cart/src/home/domain/usecases/get_all_diamonds_usecase.dart';
import 'package:diamond_cart/src/home/presentation/diamond_bloc/diamond_event.dart';
import 'package:diamond_cart/src/home/presentation/diamond_bloc/diamond_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DiamondBloc extends Bloc<DiamondEvent, DiamondState> {
  final GetAllDiamondsUseCase _getAllDiamondsUseCase =
      GetIt.instance.get<GetAllDiamondsUseCase>();

  DiamondBloc() : super(DiamondInitial()) {
    on<LoadDiamondsEvent>(_onLoadDiamonds);
  }

  Future<void> _onLoadDiamonds(
    LoadDiamondsEvent event,
    Emitter<DiamondState> emit,
  ) async {
    try {
      emit(DiamondLoading());
      final diamonds = await _getAllDiamondsUseCase.execute();
      emit(DiamondLoaded(diamonds));
    } catch (e) {
      emit(DiamondError(e.toString()));
    }
  }
}
