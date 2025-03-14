import 'package:diamond_cart/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle normalFont = TextStyle(
    fontSize: 14,
    color: AppColors.whiteColor,
  );
  static const TextStyle boldFont = TextStyle(
    fontSize: 18,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle regularFont = TextStyle(
    fontSize: 14,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle regularBoldFont = TextStyle(
    fontSize: 14,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w700,
  );
}
