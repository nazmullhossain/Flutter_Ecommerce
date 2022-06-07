


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:testecommerce/controllers/api.dart';
import 'package:testecommerce/models/model_porduct.dart';

class ProductController extends GetxController{
 var isLoading=true.obs;
 RxList<Product> product= <Product>[].obs;
 @override
 void onInit(){
  fetchProudcts();
  super.onInit();
 }

 void fetchProudcts()async{
  isLoading(true);
 try {
   var products=await ApiHelper.fetchProducts();
   if (products!=null){
    product.value=products;

   }
 } finally {
   // TODO
  isLoading(false);
 }
 }
}