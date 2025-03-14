import 'package:diamond_cart/core/constants/app_route_constants.dart';
import 'package:diamond_cart/core/resources/app_string_keys.dart';
import 'package:diamond_cart/core/resources/app_text_style.dart';
import 'package:diamond_cart/core/widgets/app_text_widget.dart';
import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';
import 'package:diamond_cart/src/home/presentation/cart_bloc/diamond_cart_bloc.dart';
import 'package:diamond_cart/src/home/presentation/cart_bloc/diamond_cart_event.dart';
import 'package:diamond_cart/src/home/presentation/diamond_bloc/diamond_bloc.dart';
import 'package:diamond_cart/src/home/presentation/diamond_bloc/diamond_event.dart';
import 'package:diamond_cart/src/home/presentation/diamond_bloc/diamond_state.dart';
import 'package:diamond_cart/src/home/presentation/views/pages/diamond_cart_screen.dart';
import 'package:diamond_cart/src/home/presentation/views/pages/filter_diamond_screen.dart';
import 'package:diamond_cart/src/home/presentation/views/widgets/diamond_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiamondListScreen extends StatefulWidget {
  static const routeName = AppRouteConstants.diamondListScreenRoute;

  const DiamondListScreen({super.key});

  @override
  State<DiamondListScreen> createState() => _DiamondListScreenState();
}

class _DiamondListScreenState extends State<DiamondListScreen> {
  @override
  void initState() {
    super.initState();
    updateDiamondData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTextWidget(
          text: AppStringKeys.appName,
          textStyle: AppTextStyle.boldFont,
        ),
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.pushNamed(context, DiamondCartScreen.routeName);
              updateDiamondData();
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () async {
              await Navigator.pushNamed(context, FilterDiamondScreen.routeName);
              updateDiamondData();
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
    );
  }

  Widget _buildDiamondList(List<Diamonds> diamonds) {
    return ListView.builder(
      itemCount: diamonds.length,
      itemBuilder: (context, index) {
        final diamond = diamonds[index];
        return DiamondDetailWidget(
          diamonds: diamond,
          onTapOfAddOrRemoveFromCart: () {
            if (diamond.addedToCart ?? true) {
              context.read<DiamondCartBloc>().add(
                RemoveDiamondFromCartEvent(diamond.lotID ?? ''),
              );
            } else {
              context.read<DiamondCartBloc>().add(
                AddDiamondToCartEvent(diamond),
              );
            }
            context.read<DiamondBloc>().add(LoadDiamondsEvent());
          },
        );
      },
    );
  }

  void updateDiamondData() {
    context.read<DiamondBloc>().add(LoadDiamondsEvent());
  }
}
