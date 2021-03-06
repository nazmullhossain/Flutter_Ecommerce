import 'package:flutter/material.dart';
import 'package:testecommerce/views/home_page_tile.dart';

import 'controllers/cart_controller.dart';
import 'controllers/product_controller.dart';
import 'package:get/get.dart';

void main() {
  ProductController  proudctController=Get.put(ProductController());
  final  cartController= Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
