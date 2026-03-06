import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monoshopping/Core/Theme/app_colors.dart';

import '../Provider/api_getProduct_provider.dart';
import '../Provider/selected_product.dart';

class ProductSearchWidget extends HookConsumerWidget {
  const ProductSearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(getProductsProvider);
    final controller = TextEditingController();
    double width=MediaQuery.sizeOf(context).width;

    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue value) {
        if (value.text.isEmpty) return const Iterable<String>.empty();

        final productsAsync = ref.watch(getProductsProvider);

        return productsAsync.when(
          data: (products) {
            final matches = products
                .map((p) => p.title)
                .where((title) =>
                title.toLowerCase().contains(value.text.toLowerCase()))
                .toList();

            if (matches.isEmpty) return ['__no_match__'];
            return matches;
          },
          loading: () => const [],
          error: (_, __) => const [],
        );
      },
      onSelected: (selected) {
        ref.read(selectedProductProvider.notifier).state = selected;
      },
      fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
        return ValueListenableBuilder<TextEditingValue>(
          valueListenable: textEditingController,
          builder: (context, value, child) {
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              onSubmitted: (_) => onFieldSubmitted(),
              decoration: InputDecoration(
                hintText: "Search product...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: value.text.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: () {
                    textEditingController.clear();
                    ref.read(selectedProductProvider.notifier).state = null;
                    FocusScope.of(context).unfocus();
                  },
                )
                    : null,
                filled: true,
                fillColor: AppColors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (val) {
                if (val.isEmpty) {
                  ref.read(selectedProductProvider.notifier).state = null;
                }
              },
            );
          },
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: width,
              child: options.isEmpty
                  ? const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "No matching product",
                  style: TextStyle(color: Colors.grey),
                ),
              ):ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  return ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: Text(option),
                    onTap: () => onSelected(option),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}