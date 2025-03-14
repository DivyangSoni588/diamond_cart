import 'package:diamond_cart/core/constants/app_route_constants.dart';
import 'package:diamond_cart/core/resources/app_string_keys.dart';
import 'package:diamond_cart/core/resources/app_text_style.dart';
import 'package:diamond_cart/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = AppRouteConstants.homeScreenRoute;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTextWidget(
          text: AppStringKeys.appName,
          textStyle: AppTextStyle.normalFont,
        ),
      ),
    );
  }
}
