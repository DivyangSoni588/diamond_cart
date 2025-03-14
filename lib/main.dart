import 'package:diamond_cart/core/services/injection_container.dart';
import 'package:diamond_cart/core/services/router.dart';
import 'package:diamond_cart/core/theme/app_theme.dart';
import 'package:diamond_cart/l10n/app_localization.dart';
import 'package:diamond_cart/src/home/presentation/diamond_filter_result_bloc/diamond_filter_result_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<DiamondFilterResultBloc>(create: (context) => DiamondFilterResultBloc())],
      child: DiamondCartApp(),
    ),
  );
}

class DiamondCartApp extends StatelessWidget {
  const DiamondCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diamond Cart',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
      ],
      onGenerateRoute: generateRoute,
    );
  }
}
