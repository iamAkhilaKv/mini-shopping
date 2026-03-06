import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monoshopping/Features/Product/Presentation/Provider/api_getProduct_provider.dart';
import 'package:monoshopping/Features/Product/Presentation/Screens/HomeScreen/home_screen_products.dart';
import 'package:monoshopping/Features/Product/Presentation/Screens/HomeScreen/titlerow.dart';

import '../../Widgets/product_tile.dart';
import '../../Widgets/widgets.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      body:SafeArea(child: Column(
        children: [
         TitleRow(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductSearchWidget(),
          ),

          Expanded(child:HomeScreenProducts())
        ],
      )),

    );
  }
}
