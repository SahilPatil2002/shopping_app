import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/cart_controller.dart';
import 'package:shopping_app/models/navigation_controller.dart';

class MyCart extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Your cart is empty",
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Get.find<NavigationController>().changeTab(1);
                  },
                  child: const Text(
                    "Explore new arrivals",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final item = cartController.cartItems[index];

            return ListTile(
              leading: Image.network(
                item.image.isNotEmpty
                    ? item.image
                    : 'https://via.placeholder.com/100',
                width: 60,
                height: 60,
              ),
              title: Text(item.title),
              subtitle: Text('\₹${item.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  cartController.removeFromCart(item);
                },
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        final originalTotal = cartController.totalPrice.value;
        final discount = originalTotal * 0.10;
        final discountedTotal = originalTotal - discount;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Original Total:", style: TextStyle(fontSize: 16)),
                  Text(
                    "\₹${originalTotal.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Discount (10%):", style: TextStyle(fontSize: 16)),
                  Text(
                    "-\₹${discount.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Payable:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\₹${discountedTotal.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () {
                  if (cartController.cartItems.isEmpty) {
                    Get.snackbar(
                      "Cart Empty",
                      "Add items to cart before placing an order.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red.shade100,
                      colorText: Colors.red.shade900,
                    );
                  } else {
                    cartController.clearCart();
                    Get.snackbar(
                      "Order",
                      "Order placed successfully!",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green.shade100,
                      colorText: Colors.green.shade900,
                    );
                  }
                },

                child: const Text(
                  "Place Order",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
