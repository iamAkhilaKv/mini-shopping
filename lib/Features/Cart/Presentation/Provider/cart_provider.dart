import 'package:hooks_riverpod/legacy.dart';
import 'package:monoshopping/Core/Network/api_class.dart';
import 'package:monoshopping/Features/Product/Data/Model/product_model.dart';

class CartNotifier extends StateNotifier<List<Product>>{
  ApiClass apiClass;
  CartNotifier(this.apiClass):super([]);

  void add(Product model){
    if (!state.any((p) => p.id == model.id)) {
      state = [...state, model];
    }
    _syncCartToApi();
  }
  void removeFromCart(Product product) {
    state = state.where((p) => p.id != product.id).toList();
    _syncCartToApi();
  }

  void clearCart() {
    state = [];
    _syncCartToApi();
  }
  Future<void> _syncCartToApi() async {
    final body = {
      "userId": 1,
      "date": DateTime.now().toIso8601String().split("T")[0],
      "products": state
          .map((p) => {"productId": p.id, "quantity": 1}) // can extend quantity
          .toList(),
    };

    try {
      final response = await apiClass.postData('https://fakestoreapi.com/carts', body: body);
      print("Cart synced: $response");
    } catch (e) {
      print("Error syncing cart: $e");
    }
  }

}

final cartProvider=StateNotifierProvider<CartNotifier,List<Product>>((ref)=>CartNotifier(ApiClass()));