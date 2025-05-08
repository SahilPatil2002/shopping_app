import 'package:flutter/material.dart';
import 'package:shopping_app/models/shopping_controller.dart';
import 'package:shopping_app/screens/splash_screen.dart';
import 'package:shopping_app/widgets/banner_carousel.dart';
import 'package:shopping_app/widgets/category_scroll_list.dart';
import 'package:get/get.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/models/cart_controller.dart';

void main() {
  Get.put(ShoppingController());
  Get.put(CartController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cartController = Get.find<CartController>();
  Widget _buildTopBox(String imagePath, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(imagePath),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTopBox('assets/images/shop.png', 'Shopkart'),
                    _buildTopBox('assets/images/grocery.png', 'Grocery'),
                    _buildTopBox('assets/images/travel.png', 'Travel'),
                    _buildTopBox('assets/images/money.png', 'Pay'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for products',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.deepOrange,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.deepOrange,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                ),
              ),

              SizedBox(height: 20),

              BannerCarousel(),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: RichText(
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                  textScaler: TextScaler.linear(1),
                  maxLines: 1,
                  text: TextSpan(
                    text: 'Top ',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Categories',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                // child: Text("Top Categories", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20),

              CategoryScrollList(),

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: RichText(
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                  textScaler: TextScaler.linear(1),
                  maxLines: 1,
                  text: TextSpan(
                    text: 'Latest ',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Products',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ProductGridSection(),

              SizedBox(height: 10),
              Container(
                height: 300,
                margin: EdgeInsets.symmetric(horizontal: 16),
                color: Colors.grey[300],
                child: Center(child: Text('Future content goes here')),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.shopping_cart, color: Colors.deepOrange),
                  SizedBox(width: 8),
                  Text(
                    "Items: ${cartController.count}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "Total: \$${cartController.totalPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }),
    );
  }
}
