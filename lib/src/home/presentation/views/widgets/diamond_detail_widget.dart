import 'package:diamond_cart/core/extensions/context_extension.dart';
import 'package:diamond_cart/core/resources/app_colors.dart';
import 'package:diamond_cart/core/resources/app_string_keys.dart';
import 'package:diamond_cart/core/resources/app_text_style.dart';
import 'package:diamond_cart/core/widgets/app_text_widget.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:flutter/material.dart';

class DiamondDetailWidget extends StatelessWidget {
  final Diamonds diamonds;
  final VoidCallback onTapOfAddOrRemoveFromCart;
  final bool showListing;

  const DiamondDetailWidget({
    super.key,
    required this.diamonds,
    required this.onTapOfAddOrRemoveFromCart,
    this.showListing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      elevation: 10,
      shape: Border.all(color: AppColors.blackColor),
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.qty.toString(),
              label: AppStringKeys.quantity,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.color,
              label: AppStringKeys.color,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.carat.toString(),
              label: AppStringKeys.carat,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.lotID,
              label: AppStringKeys.lotId,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.size,
              label: AppStringKeys.size,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.lab,
              label: AppStringKeys.lab,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.shape,
              label: AppStringKeys.shape,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.clarity,
              label: AppStringKeys.clarity,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.cut,
              label: AppStringKeys.cut,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.polish,
              label: AppStringKeys.polish,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.symmetry,
              label: AppStringKeys.symmetry,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.fluorescence,
              label: AppStringKeys.fluorescence,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.discount.toString(),
              label: AppStringKeys.discount,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.perCaratRate.toString(),
              label: AppStringKeys.perCaratRate,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.finalAmount.toString(),
              label: AppStringKeys.finalAmount,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.keyToSymbol,
              label: AppStringKeys.keyToSymbol,
            ),
            SizedBox(height: 6),
            _buildLabeledDetailWidget(
              context: context,
              desc: diamonds.labComment,
              label: AppStringKeys.labComment,
            ),
            SizedBox(height: 6),
            if (!showListing)
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: onTapOfAddOrRemoveFromCart,
                  child: AppTextWidget(
                    text:
                        (diamonds.addedToCart ?? false)
                            ? AppStringKeys.removeFromCart
                            : AppStringKeys.addToCart,
                    textStyle: AppTextStyle.normalFont,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget _buildLabeledDetailWidget({
  required BuildContext context,
  required String label,
  required String? desc,
}) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: context.appLocalizations.translate(label),
          style: AppTextStyle.regularBoldFont,
        ),
        TextSpan(text: ': ', style: AppTextStyle.regularBoldFont),
        TextSpan(text: desc ?? 'N/A', style: AppTextStyle.regularFont),
      ],
    ),
  );
}
