import 'package:diamond_cart/core/constants/app_route_constants.dart';
import 'package:diamond_cart/core/resources/app_string_keys.dart';
import 'package:diamond_cart/core/resources/app_text_style.dart';
import 'package:diamond_cart/core/widgets/app_text_widget.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_filter_entity.dart';
import 'package:diamond_cart/src/home/presentation/cart_bloc/diamond_cart_bloc.dart';
import 'package:diamond_cart/src/home/presentation/cart_bloc/diamond_cart_event.dart';
import 'package:diamond_cart/src/home/presentation/diamond_filter_result_bloc/diamond_filter_result_bloc.dart';
import 'package:diamond_cart/src/home/presentation/views/widgets/diamond_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredDiamondResultScreen extends StatefulWidget {
  static const routeName = AppRouteConstants.filteredDiamondResultScreen;
  final DiamondFilterEntity diamondFilterEntity;

  const FilteredDiamondResultScreen({
    super.key,
    required this.diamondFilterEntity,
  });

  @override
  State<FilteredDiamondResultScreen> createState() =>
      _FilteredDiamondResultScreenState();
}

class _FilteredDiamondResultScreenState
    extends State<FilteredDiamondResultScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DiamondFilterResultBloc>().add(
      ApplyDiamondFilter(widget.diamondFilterEntity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTextWidget(
          text: AppStringKeys.filteredDiamonds,
          textStyle: AppTextStyle.boldFont,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showSortModal(context);
            },
            icon: Icon(Icons.sort),
          ),
        ],
      ),
      body: BlocBuilder<DiamondFilterResultBloc, DiamondFilterResultState>(
        builder: (context, state) {
          if (state is DiamondFilterResultLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DiamondFilterResultLoaded) {
            if (state.diamonds.isEmpty) {
              return Center(
                child: AppTextWidget(
                  text: AppStringKeys.noDataFound,
                  textStyle: AppTextStyle.regularBoldFont,
                ),
              );
            }
            return ListView.builder(
              itemCount: state.diamonds.length,
              itemBuilder: (context, index) {
                final Diamonds diamond = state.diamonds[index];
                return DiamondDetailWidget(
                  diamonds: diamond,
                  onTapOfAddOrRemoveFromCart: () {
                    if (diamond.addedToCart ?? false) {
                      context.read<DiamondCartBloc>().add(
                        RemoveDiamondFromCartEvent(diamond.lotID ?? ''),
                      );
                    } else {
                      context.read<DiamondCartBloc>().add(
                        AddDiamondToCartEvent(diamond),
                      );
                    }
                    context.read<DiamondFilterResultBloc>().add(
                      ApplyDiamondFilter(widget.diamondFilterEntity),
                    );
                  },
                );
              },
            );
          } else if (state is DiamondFilterResultError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const Center(child: Text("Apply filters to see results."));
        },
      ),
    );
  }

  void _showSortModal(BuildContext context) {
    final diamondFilterResultBloc = BlocProvider.of<DiamondFilterResultBloc>(
      context,
    );

    final List<String> sortOptions = [
      'Final Price (Asc)',
      'Final Price (Desc)',
      'Carat Weight (Asc)',
      'Carat Weight (Desc)',
    ];

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (bottomSheetContext) {
        return BlocProvider.value(
          // ✅ Pass the existing Bloc instance
          value: diamondFilterResultBloc,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sort by:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ...sortOptions.map(
                  (option) => ListTile(
                    title: Text(option),
                    onTap: () {
                      diamondFilterResultBloc.add(
                        SortDiamonds(option),
                      ); // ✅ Trigger sorting
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
