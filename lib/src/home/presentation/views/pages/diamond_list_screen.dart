import 'package:diamond_cart/core/constants/app_route_constants.dart';
import 'package:diamond_cart/core/resources/app_string_keys.dart';
import 'package:diamond_cart/core/resources/app_text_style.dart';
import 'package:diamond_cart/core/widgets/app_text_widget.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/presentation/diamond_bloc/diamond_bloc.dart';
import 'package:diamond_cart/src/home/presentation/diamond_bloc/diamond_event.dart';
import 'package:diamond_cart/src/home/presentation/diamond_bloc/diamond_state.dart';
import 'package:diamond_cart/src/home/presentation/views/pages/filter_diamond_screen.dart';
import 'package:diamond_cart/src/home/presentation/views/widgets/diamond_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiamondListScreen extends StatelessWidget {
  static const routeName = AppRouteConstants.diamondListScreenRoute;

  const DiamondListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DiamondBloc()..add(LoadDiamondsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: AppTextWidget(
            text: AppStringKeys.appName,
            textStyle: AppTextStyle.boldFont,
          ),
          elevation: 4,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FilterDiamondScreen.routeName);
              },
              icon: Icon(Icons.filter_alt),
            ),
          ],
        ),
        body: BlocBuilder<DiamondBloc, DiamondState>(
          builder: (context, state) {
            if (state is DiamondLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DiamondLoaded) {
              return _buildDiamondList(state.diamonds);
            } else if (state is DiamondError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('No diamonds found'));
          },
        ),
      ),
    );
  }

  Widget _buildDiamondList(List<Diamonds> diamonds) {
    return ListView.builder(
      itemCount: diamonds.length,
      itemBuilder: (context, index) {
        final diamond = diamonds[index];
        return DiamondDetailWidget(diamonds: diamond);
      },
    );
  }
}
