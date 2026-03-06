import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:monoshopping/Features/Product/Presentation/Screens/ProductScreen/product_detailed_screen.dart';

import '../../Features/Product/Data/Model/product_model.dart';
import '../../Features/Product/Presentation/Screens/HomeScreen/home_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            final product = state.extra as Product;
            return ProductDetailedScreen( product: product);
          },
        ),
      ],
    ),
  ],
);
