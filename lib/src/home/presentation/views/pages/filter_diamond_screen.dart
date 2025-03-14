import 'package:diamond_cart/core/constants/app_route_constants.dart';
import 'package:diamond_cart/core/extensions/context_extension.dart';
import 'package:diamond_cart/core/resources/app_string_keys.dart';
import 'package:diamond_cart/core/resources/app_text_style.dart';
import 'package:diamond_cart/core/widgets/app_text_widget.dart';
import 'package:diamond_cart/src/home/presentation/filter_bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterDiamondScreen extends StatelessWidget {
  const FilterDiamondScreen({super.key});

  static const routeName = AppRouteConstants.filterDiamondScreen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FilterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: AppTextWidget(
            text: AppStringKeys.filterDiamonds,
            textStyle: AppTextStyle.boldFont,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              final filterBloc = context.read<FilterBloc>();

              return Column(
                children: [
                  // Carat Range
                  Text(
                    "Carat Range: ${state.minCarat.toStringAsFixed(1)} - ${state.maxCarat.toStringAsFixed(1)}",
                  ),
                  RangeSlider(
                    min: 0.2,
                    max: 5.0,
                    values: RangeValues(state.minCarat, state.maxCarat),
                    onChanged: (values) {
                      filterBloc.add(
                        UpdateCaratRange(min: values.start, max: values.end),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // Lab Dropdown
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Lab"),
                    value: state.selectedLab,
                    items:
                        ['GIA', 'IGI', 'HRD']
                            .map(
                              (lab) => DropdownMenuItem(
                                value: lab,
                                child: Text(lab),
                              ),
                            )
                            .toList(),
                    onChanged: (value) => filterBloc.add(UpdateLab(lab: value)),
                  ),
                  const SizedBox(height: 20),

                  // Shape Dropdown
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Shape"),
                    value: state.selectedShape,
                    items:
                        ["BR", "CU", "EM", "MQ", "OV", "PR", "PS", "RAD", "HS"]
                            .map(
                              (shape) => DropdownMenuItem(
                                value: shape,
                                child: Text(shape),
                              ),
                            )
                            .toList(),
                    onChanged:
                        (value) => filterBloc.add(UpdateShape(shape: value)),
                  ),
                  const SizedBox(height: 20),

                  // Color Dropdown
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Color"),
                    value: state.selectedColor,
                    items:
                        ['D', 'E', 'F', 'G', 'H', 'I', 'J']
                            .map(
                              (color) => DropdownMenuItem(
                                value: color,
                                child: Text(color),
                              ),
                            )
                            .toList(),
                    onChanged:
                        (value) => filterBloc.add(UpdateColor(color: value)),
                  ),
                  const SizedBox(height: 20),

                  // Clarity Chips
                  Wrap(
                    children:
                        [
                          'FL',
                          'IF',
                          'VVS1',
                          'VVS2',
                          'VS1',
                          'VS2',
                          'SI1',
                          'SI2',
                          'I1',
                          'I2',
                          'I3',
                        ].map((clarity) {
                          final isSelected = state.selectedClarities.contains(
                            clarity,
                          );
                          return ChoiceChip(
                            label: Text(clarity),
                            selected: isSelected,
                            onSelected: (selected) {
                              filterBloc.add(
                                ToggleClarity(
                                  clarity: clarity,
                                  isSelected: selected,
                                ),
                              );
                            },
                          );
                        }).toList(),
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final filterBloc = context.read<FilterBloc>();
                      final filterEntity = filterBloc.state.toEntity();

                      Navigator.pushNamed(
                        context,
                        AppRouteConstants.filteredDiamondResultScreen,
                        arguments: filterEntity,
                      );
                    },
                    child: AppTextWidget(
                      text: context.appLocalizations.translate(
                        AppStringKeys.search,
                      ),
                      textStyle: AppTextStyle.regularFont,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
