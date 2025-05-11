import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  var totalPrice = 0.0.obs; // Reactive total price

  int get count => cartItems.length;

  @override
  void onInit() {
    super.onInit();
    loadCartData();
  }

  // Add product to cart and update total
  void addToCart(Product product) {
    cartItems.add(product);
    updateTotal(); // Update total after adding
    saveCartData();
  }

  // Remove product from cart and update total
  void removeFromCart(Product product) {
    try {
      cartItems.remove(product);
      updateTotal(); // Update total after removing
      saveCartData();
    } catch (e) {
      print('Error removing product: $e');
    }
  }

  // Clear the cart and update total
  void clearCart() {
    cartItems.clear();
    updateTotal(); // Update total after clearing cart
    saveCartData();
  }

  // Recalculate the total price after changes
  void updateTotal() {
    totalPrice.value = cartItems.fold(0, (sum, item) => sum + item.price);
  }

  // Save the total price and item count to shared preferences
  Future<void> saveCartData() async {
  final prefs = await SharedPreferences.getInstance();

  List<Map<String, dynamic>> cartList = cartItems.map((item) => {
    'id': item.id,
    'title': item.title,
    'description': item.description,
    'image': item.image,
    'price': item.price,
    'rating': item.rating,
  }).toList();

  prefs.setString('cartItems', jsonEncode(cartList));
  prefs.setDouble('totalPrice', totalPrice.value);
}


  // Load saved cart data from shared preferences
  Future<void> loadCartData() async {
  final prefs = await SharedPreferences.getInstance();
  final String? cartJson = prefs.getString('cartItems');
  final double? savedTotal = prefs.getDouble('totalPrice');

  if (cartJson != null) {
    final List<dynamic> decodedList = jsonDecode(cartJson);

    cartItems.value = decodedList.map((item) => Product(
      id: item['id'],
      title: item['title'],
      description: item['description'],
      image: item['image'],
      price: item['price'],
      rating: item['rating'],
    )).toList();

    totalPrice.value = savedTotal ?? 0.0;
  }
}

}
