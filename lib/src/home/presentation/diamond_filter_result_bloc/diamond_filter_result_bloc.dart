import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_filter_entity.dart';
import 'package:diamond_cart/src/home/domain/usecases/get_filtered_diamond_use_case.dart';
import 'package:diamond_cart/src/home/domain/usecases/sort_diamonds_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'diamond_filter_result_event.dart';
part 'diamond_filter_result_state.dart';

class DiamondFilterResultBloc
    extends Bloc<DiamondFilterResultEvent, DiamondFilterResultState> {
  final GetFilteredDiamondUseCase _getFilteredDiamondUseCase =
      GetIt.instance.get<GetFilteredDiamondUseCase>();
  final SortDiamondsUseCase _sortDiamondsUseCase =
      GetIt.instance.get<SortDiamondsUseCase>();

  List<Diamonds> _currentDiamonds = [];
  String? _currentSortOption;
  DiamondFilterResultBloc() : super(DiamondFilterResultInitial()) {
    on<ApplyDiamondFilter>(_onLoadDiamonds);
    on<SortDiamonds>(_onSortDiamonds);
  }

  Future<void> _onLoadDiamonds(
    ApplyDiamondFilter event,
    Emitter<DiamondFilterResultState> emit,
  ) async {
    emit(DiamondFilterResultLoading());
    try {
      final diamonds = await _getFilteredDiamondUseCase.execute(
        event.diamondFilterEntity,
      );
      _currentDiamonds = diamonds;
      emit(DiamondFilterResultLoaded(diamonds));
    } catch (e) {
      emit(DiamondFilterResultError("Failed to load diamonds"));
    }
  }

  Future<void> _onSortDiamonds(
    SortDiamonds event,
    Emitter<DiamondFilterResultState> emit,
  ) async {
    try {
      emit(DiamondFilterResultLoading());

      _currentSortOption = event.sortOption;
      _currentDiamonds = _sortDiamondsUseCase.execute(
        _currentDiamonds,
        event.sortOption,
      );

      emit(DiamondFilterResultLoaded(_currentDiamonds));
    } catch (e) {
      emit(DiamondFilterResultError(e.toString()));
    }
  }
}
