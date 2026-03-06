import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monoshopping/Core/Network/api_urls.dart';

import '../../../../Core/Network/api_client.dart';
import '../../Data/Model/product_model.dart';

final getProductsProvider=FutureProvider<List<Product>>((ref) async{

  final api=ref.watch(apiClient);

  final data=await api.getData(BaseUrl().getUrl);

  return data.map((e)=>Product.fromJson(e)).toList();


});