import 'package:flutter/material.dart';

class MyProductPage extends StatelessWidget {
  const MyProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Text(
        'My Product Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    
    ),);
  }
}