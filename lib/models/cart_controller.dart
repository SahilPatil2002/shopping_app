import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;
  var totalPrice = 0.0.obs;

  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
    totalPrice.value += product['price'];
  }

  void clearCart() {
    cartItems.clear();
    totalPrice.value = 0.0;
  }
}
