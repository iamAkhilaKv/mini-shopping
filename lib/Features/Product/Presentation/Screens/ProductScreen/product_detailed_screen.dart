import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monoshopping/Features/Product/Data/Model/product_model.dart';

class ProductDetailedScreen extends HookConsumerWidget {
 final Product product;
 const ProductDetailedScreen({super.key,required this.product});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop",style: Theme.of(context).textTheme.titleLarge,),

      ),
      body: SafeArea(
        child: Column(
          children: [
                Gap(40),
                Expanded(
                  flex: 4,
                  child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                          fit: BoxFit.cover,
                        ),
                      ),


                ),

              Gap(40),

         Column(
                  children: [
                    Text(product.title,maxLines: 2,overflow: TextOverflow.ellipsis,style:
                    TextStyle(color:  Theme.of(context).colorScheme.secondary,
                        fontSize: 18,fontWeight: FontWeight.bold)

                   ),

                    Gap(10),


                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Text(product.description,style: Theme.of(context).textTheme.titleMedium,),
                     ),

                  ],
                ),


            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: () {},

                  child: const Text("Add to Cart"),
                ),
              ),
            )



          ],

        ),
      ),

    );
  }
}
