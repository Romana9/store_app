import 'package:flutter/material.dart';
import 'package:store/screens/home.dart';
import 'package:store/screens/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      initialRoute: '/homePage',
      routes: {
        '/homePage': (context) => const Home(),
        '/updatePage': (context) => const UpdateProductPage(),
      },
    );
  }
}
