import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
        'My Profile',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )),
    );
  }
}