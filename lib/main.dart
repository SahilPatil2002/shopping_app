import 'package:flutter/material.dart';
import 'package:shopping_app/screens/login_page.dart';
import 'package:shopping_app/screens/second_page.dart';
import 'package:shopping_app/screens/sign_in_page.dart';
import 'package:shopping_app/screens/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepOrange
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: Center(
          child: Text("Hello World"),
        ),
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(),
            ),
          );
        },
        child: Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
