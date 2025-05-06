import 'package:flutter/material.dart';
import 'package:shopping_app/screens/splash_screen.dart';
import 'package:shopping_app/widgets/banner_carousel.dart';
import 'package:shopping_app/widgets/category_scroll_list.dart';

void main() {
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
  Widget _buildTopBox(IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.only(bottom: 20, top: 20, left: 28, right: 28),
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTopBox(Icons.store, 'Shopkart'),
                    _buildTopBox(Icons.shopping_bag, 'Grocery'),
                    _buildTopBox(Icons.flight, 'Travel'),
                    _buildTopBox(Icons.payment, 'Pay'),
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
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
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

              CategoryScrollList(),

              SizedBox(height: 10),
              Container(
                height: 300,
                margin: EdgeInsets.symmetric(horizontal: 16),
                color: Colors.grey[300],
                child: Center(child: Text('Future content goes here')),
              ),
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
    );
  }
}
