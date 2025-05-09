import 'package:flutter/material.dart';
import 'package:shopping_app/models/shopping_controller.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/screens/my_cart.dart';
import 'package:shopping_app/screens/product_page.dart';
import 'package:shopping_app/screens/profile.dart';
import 'package:shopping_app/screens/splash_screen.dart';
import 'package:shopping_app/widgets/banner_carousel.dart';
import 'package:shopping_app/widgets/category_scroll_list.dart';
import 'package:get/get.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/models/cart_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  Get.put(ShoppingController());
  Get.put(CartController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
  int _page = 0;

  final List<Widget> _screens = [
    MyHomeScreen(),
    MyProductPage(),
    MyCart(),
    MyProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_page],
      bottomNavigationBar: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                const SizedBox(width: 8),
                Text(
                  "Items: ${cartController.count}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "Total: \$${cartController.totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }),

    CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: Colors.deepOrange,
      buttonBackgroundColor: Colors.orangeAccent,
      height: 60,
      items: const <Widget>[
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.shopping_bag, size: 30, color: Colors.white),
        Icon(Icons.shopping_cart, size: 30, color: Colors.white),
        Icon(Icons.person, size: 30, color: Colors.white),
      ],
      index: _page,
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
    ),
  ],
),

    );
  }
}
