import 'package:diamond_cart/src/home/domain/entities/diamond_filter_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState()) {
    on<UpdateCaratRange>((event, emit) {
      emit(state.copyWith(minCarat: event.min, maxCarat: event.max));
    });

    on<UpdateLab>((event, emit) {
      emit(state.copyWith(selectedLab: event.lab));
    });

    on<UpdateShape>((event, emit) {
      emit(state.copyWith(selectedShape: event.shape));
    });

    on<UpdateColor>((event, emit) {
      emit(state.copyWith(selectedColor: event.color));
    });

    on<ToggleClarity>((event, emit) {
      final updatedClarities = List<String>.from(state.selectedClarities);
      event.isSelected
          ? updatedClarities.add(event.clarity)
          : updatedClarities.remove(event.clarity);
      emit(state.copyWith(selectedClarities: updatedClarities));
    });
  }
}
