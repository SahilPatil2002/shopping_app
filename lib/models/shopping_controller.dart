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
      var response = await Dio().get('https://fakestoreapi.com/products?limit=12');
      var data = response.data as List;
      products.value = data.map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      print("Error fetching products: $e");
    }
  }
}
