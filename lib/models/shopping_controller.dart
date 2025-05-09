import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      var response = await Dio().get('https://fakestoreapi.com/products');
      var data = response.data as List;
      products.value = data.map((e) => Product.fromJson(e)).toList();
      print("Fetched ${products.length} products");
    } catch (e) {
      print("Error fetching products: $e");
    }
  }
}
