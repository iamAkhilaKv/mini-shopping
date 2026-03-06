import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monoshopping/Features/Cart/Presentation/Provider/cart_provider.dart';

class TitleRow extends HookConsumerWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cartItems=ref.watch(cartProvider);
    return  SizedBox(
      height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Gap(30),
            Text("Mini-Shop",style: Theme.of(context).textTheme.titleLarge,),
            Stack(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
                  Positioned(
                      top: 2,
                      child: Text(cartItems.length.toString(),style: TextStyle(
                        color: Theme.of(context).colorScheme.error
                      ),))
                ],
           ),



          ],
        ),
      );

  }
}
