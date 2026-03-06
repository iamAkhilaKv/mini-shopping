import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../Core/Network/no_internet/no_internet_provider.dart';
import '../../../../../Core/Network/no_internet/no_internet_widget.dart';
import '../../Provider/api_getProduct_provider.dart';
import '../../Provider/selected_product.dart';
import '../../Widgets/product_tile.dart';

class HomeScreenProducts extends HookConsumerWidget {
  const HomeScreenProducts({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final productsAsync=ref.watch(getProductsProvider);
    final connectivityAsync = ref.watch(connectivityProvider);
    final selectedTitle = ref.watch(selectedProductProvider);
    return Scaffold(
      body: connectivityAsync.when(
          data: (connectivityList) {

            if (connectivityList.contains(ConnectivityResult.none)) {
              return  NoInternetWidget().noInternet();
            }
         return   productsAsync.when(
          data: (products){

            if (products.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      "No products available",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }
            final filteredProducts = selectedTitle == null
                ? products
                : products.where((p) => p.title == selectedTitle).toList();
            return GridView.builder(
              cacheExtent: 500,
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductTile(product: product);
              },
            );


          },
          error: (e,_)=>Center(child: Text("Error : $e")),
          loading: ()=>Center(child: CircularProgressIndicator()
          ));

            },
          loading: () => const Center(child: CircularProgressIndicator()),
    error: (err, stack) => Center(child: Text("Connectivity error: $err")),
    ),
    );




  }
}
