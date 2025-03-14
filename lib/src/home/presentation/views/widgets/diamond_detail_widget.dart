import 'package:diamond_cart/core/extensions/context_extension.dart';
import 'package:diamond_cart/core/resources/app_colors.dart';
import 'package:diamond_cart/core/resources/app_string_keys.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:flutter/material.dart';

class DiamondDetailWidget extends StatelessWidget {
  final Diamonds diamonds;

  const DiamondDetailWidget({super.key, required this.diamonds});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: Border.all(color: AppColors.blackColor),
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: context.appLocalizations.translate(
                    AppStringKeys.appName,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
