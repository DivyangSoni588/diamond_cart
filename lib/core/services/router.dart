import 'package:diamond_cart/src/home/domain/entities/diamond_filter_entity.dart';
import 'package:diamond_cart/src/home/presentation/views/pages/diamond_cart_screen.dart';
import 'package:diamond_cart/src/home/presentation/views/pages/diamond_list_screen.dart';
import 'package:diamond_cart/src/home/presentation/views/pages/filter_diamond_screen.dart';
import 'package:diamond_cart/src/home/presentation/views/pages/filtered_diamond_result_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case DiamondListScreen.routeName:
      return _pageBuilder((_) => const DiamondListScreen(), settings: settings);
    case FilterDiamondScreen.routeName:
      return _pageBuilder(
        (_) => const FilterDiamondScreen(),
        settings: settings,
      );
    case DiamondCartScreen.routeName:
      return _pageBuilder((_) => const DiamondCartScreen(), settings: settings);
    case FilteredDiamondResultScreen.routeName:
      final DiamondFilterEntity diamondFilterEntity =
          args as DiamondFilterEntity;
      return _pageBuilder(
        (_) => FilteredDiamondResultScreen(
          diamondFilterEntity: diamondFilterEntity,
        ),
        settings: settings,
      );
    default:
      return _pageBuilder((_) => const Placeholder(), settings: settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, _, __) => page(context),
    settings: settings,
    transitionsBuilder: (_, animation, __, child) {
      const begin = Offset(1.0, 0.0); // Slide from right
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
