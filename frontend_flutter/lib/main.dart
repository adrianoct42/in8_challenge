import 'package:flutter/material.dart';
import 'package:frontend_flutter/screens/cart_screen.dart';
import 'package:frontend_flutter/screens/home_screen.dart';
import 'package:frontend_flutter/screens/purchased_sceen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    home: HomeScreen(),
    title: "In8 Flutter Challenge",
    debugShowCheckedModeBanner: false,
    initialRoute: "/products",
    getPages: [
      GetPage(name: "/products", page: () => const HomeScreen()),
      GetPage(name: "/cart", page: () => const CartScreen()),
      GetPage(name: "/purchased", page: () => const PurchasedSceen())
    ],
    theme: ThemeData(
      primarySwatch: Colors.lightBlue,
      scaffoldBackgroundColor: Colors.blue[100],
    ),
  ));
}
