import 'package:diamond_cart/core/constants/app_route_constants.dart';
import 'package:diamond_cart/core/extensions/context_extension.dart';
import 'package:diamond_cart/core/resources/app_colors.dart';
import 'package:diamond_cart/core/resources/app_string_keys.dart';
import 'package:diamond_cart/core/resources/app_text_style.dart';
import 'package:diamond_cart/core/widgets/app_text_widget.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/presentation/cart_bloc/diamond_cart_bloc.dart';
import 'package:diamond_cart/src/home/presentation/cart_bloc/diamond_cart_event.dart';
import 'package:diamond_cart/src/home/presentation/cart_bloc/diamond_cart_state.dart';
import 'package:diamond_cart/src/home/presentation/views/widgets/diamond_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiamondCartScreen extends StatefulWidget {
  const DiamondCartScreen({super.key});

  static const String routeName = AppRouteConstants.diamondCartScreenRoute;

  @override
  State<DiamondCartScreen> createState() => _DiamondCartScreenState();
}

class _DiamondCartScreenState extends State<DiamondCartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DiamondCartBloc>().add(LoadCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTextWidget(
          text: AppStringKeys.cart,
          textStyle: AppTextStyle.boldFont,
        ),
      ),
      body: BlocBuilder<DiamondCartBloc, DiamondCartState>(
        builder: (context, state) {
          if (state is DiamondCartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DiamondCartLoaded) {
            if (state.diamonds.isEmpty) {
              return Center(
                child: AppTextWidget(
                  text: AppStringKeys.noDataFound,
                  textStyle: AppTextStyle.regularBoldFont,
                ),
              );
            }
            // Total Carat
            final String totalCarat = state.diamonds
                .map((e) => e.carat ?? 0)
                .reduce((a, b) => a + b)
                .toStringAsFixed(2); // Convert to string with 2 decimal places

            // Total Price
            final num totalPrice = state.diamonds
                .map((e) => e.finalAmount ?? 0)
                .reduce((a, b) => a + b);

            final String averagePrice = (totalPrice / state.diamonds.length)
                .toStringAsFixed(2);

            // Average Discount
            // Average Discount
            final String averageDiscount = (state.diamonds
                        .map((e) => e.discount ?? 0)
                        .reduce((a, b) => a + b)
                        .toDouble() /
                    (state.diamonds.length))
                .toStringAsFixed(2);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.diamonds.length,
                    itemBuilder: (context, index) {
                      final Diamonds diamond = state.diamonds[index];
                      return DiamondDetailWidget(
                        diamonds: diamond,
                        onTapOfAddOrRemoveFromCart: () {
                          context.read<DiamondCartBloc>().add(
                            RemoveDiamondFromCartEvent(diamond.lotID ?? ''),
                          );
                          context.read<DiamondCartBloc>().add(LoadCartEvent());
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: context.width,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLabeledDetailWidget(
                        label: AppStringKeys.totalCarat,
                        desc: totalCarat,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledDetailWidget(
                        label: AppStringKeys.totalPrice,
                        desc: totalPrice.toStringAsFixed(2),
                      ),
                      SizedBox(height: 12),

                      _buildLabeledDetailWidget(
                        label: AppStringKeys.averageDiscount,
                        desc: averageDiscount,
                      ),
                      SizedBox(height: 12),

                      _buildLabeledDetailWidget(
                        label: AppStringKeys.averagePrice,
                        desc: averagePrice,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is DiamondCartError) {
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

  Widget _buildLabeledDetailWidget({
    required String label,
    required String? desc,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: context.appLocalizations.translate(label),
            style: AppTextStyle.boldFont,
          ),
          TextSpan(text: ': ', style: AppTextStyle.boldFont),
          TextSpan(text: desc ?? 'N/A', style: AppTextStyle.normalFont),
        ],
      ),
    );
  }
}
