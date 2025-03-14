class DiamondFilterEntity {
  final double minCarat;
  final double maxCarat;
  final String? selectedLab;
  final String? selectedShape;
  final String? selectedColor;
  final List<String> selectedClarities;

  DiamondFilterEntity(
    this.minCarat,
    this.maxCarat,
    this.selectedLab,
    this.selectedShape,
    this.selectedColor,
    this.selectedClarities,
  );
}
