import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/cart_controller.dart';
import 'package:shopping_app/models/shopping_controller.dart';
import 'package:shopping_app/screens/product_page.dart';

class ProductGridSection extends StatelessWidget {
  final controller = Get.find<ShoppingController>();

  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.products.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  controller.products.length > 12
                      ? 12
                      : controller.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Image.network(
                              product.image,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price}',
                              style: TextStyle(color: Colors.green),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  '${product.rating}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              cartController.addToCart(product);
                            },
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Get.to(MyProductPage());
              },
              child: Text("Check all products"),
            ),
          ],
        ),
      );
    });
  }
}
