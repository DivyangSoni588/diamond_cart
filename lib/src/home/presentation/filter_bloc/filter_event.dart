part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateCaratRange extends FilterEvent {
  final double min;
  final double max;

  UpdateCaratRange({required this.min, required this.max});

  @override
  List<Object?> get props => [min, max];
}

class UpdateLab extends FilterEvent {
  final String? lab;

  UpdateLab({required this.lab});

  @override
  List<Object?> get props => [lab];
}

class UpdateShape extends FilterEvent {
  final String? shape;

  UpdateShape({required this.shape});

  @override
  List<Object?> get props => [shape];
}

class UpdateColor extends FilterEvent {
  final String? color;

  UpdateColor({required this.color});

  @override
  List<Object?> get props => [color];
}

class ToggleClarity extends FilterEvent {
  final String clarity;
  final bool isSelected;

  ToggleClarity({required this.clarity, required this.isSelected});

  @override
  List<Object?> get props => [clarity, isSelected];
}
