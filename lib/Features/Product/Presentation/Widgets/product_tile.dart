import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../Cart/Presentation/Provider/cart_provider.dart';
import '../../Data/Model/product_model.dart';

class ProductTile extends HookConsumerWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // Watch the cart provider
    final cart = ref.watch(cartProvider);

    final isInCart = cart.any((p) => p.id == product.id);

    return InkWell(
      onTap: (){
        context.push('/details',extra: product);
      },
      child: Card(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    isInCart ? Icons.favorite : Icons.favorite_outline,
                    color: isInCart ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    final cartNotifier = ref.read(cartProvider.notifier);
                    if (isInCart) {
                      cartNotifier.removeFromCart(product);
                    } else {
                      cartNotifier.add(product);
                    }
                  },
                ),),
            Expanded(child:
            CachedNetworkImage(
              imageUrl: product.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
      
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis,style:
                  TextStyle(color:Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),)
              ) ,
            Text("\$${product.price}", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}