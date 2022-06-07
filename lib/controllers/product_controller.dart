


import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:testecommerce/controllers/api.dart';
import 'package:testecommerce/models/model_porduct.dart';

class ProductController extends GetxController{
 RxList<Product> product= <Product>[].obs;

 void fetchProudcts()async{
 var products=await ApiHelper.fetchProducts();
 if (products!=null){

 }
 }
}