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
    prefs.setDouble('totalPrice', totalPrice.value); // Save the updated total
    prefs.setInt('itemCount', count); // Save the updated count
  }

  // Load saved cart data from shared preferences
  Future<void> loadCartData() async {
    final prefs = await SharedPreferences.getInstance();
    double? savedTotal = prefs.getDouble('totalPrice');
    int? savedCount = prefs.getInt('itemCount');

    if (savedTotal != null && savedCount != null) {
      // Simulate items in cart (just placeholders, not actual products)
      for (int i = 0; i < savedCount; i++) {
        cartItems.add(Product(
          id: i,
          title: 'Saved Item',
          description: '',
          image: '',
          price: savedTotal / savedCount, // Distribute saved total among items
          rating: 0,
        ));
      }
      totalPrice.value = savedTotal; // Load saved total price
    }
  }
}
