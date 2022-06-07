

import 'package:get/get.dart';

import '../models/model_porduct.dart';

class CartController extends GetxController{

  var cartItems=<Product>[].obs;
  int get count=>cartItems.length;

  // double get totalPrice=> cartItems.fold(0, (sum, item)=> );




  addToCart(Product product){
    cartItems.add(product);
  }

}