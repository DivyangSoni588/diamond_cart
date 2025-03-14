part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final double minCarat;
  final double maxCarat;
  final String? selectedLab;
  final String? selectedShape;
  final String? selectedColor;
  final List<String> selectedClarities;

  const FilterState({
    this.minCarat = 0.2,
    this.maxCarat = 5.0,
    this.selectedLab,
    this.selectedShape,
    this.selectedColor,
    this.selectedClarities = const [],
  });

  // Convert FilterState to DiamondFilterEntity
  DiamondFilterEntity toEntity() {
    return DiamondFilterEntity(
      minCarat,
      maxCarat,
      selectedLab,
      selectedShape,
      selectedColor,
      selectedClarities,
    );
  }

  FilterState copyWith({
    double? minCarat,
    double? maxCarat,
    String? selectedLab,
    String? selectedShape,
    String? selectedColor,
    List<String>? selectedClarities,
  }) {
    return FilterState(
      minCarat: minCarat ?? this.minCarat,
      maxCarat: maxCarat ?? this.maxCarat,
      selectedLab: selectedLab ?? this.selectedLab,
      selectedShape: selectedShape ?? this.selectedShape,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedClarities: selectedClarities ?? this.selectedClarities,
    );
  }

  @override
  List<Object?> get props => [
    minCarat,
    maxCarat,
    selectedLab,
    selectedShape,
    selectedColor,
    selectedClarities,
  ];
}
