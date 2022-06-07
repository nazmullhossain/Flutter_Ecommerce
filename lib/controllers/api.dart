
import 'package:http/http.dart' as http;

import '../models/model_porduct.dart';
import '../varriables/varriable.dart';
class ApiHelper{
static var client= http.Client();

static Future<List<Product>?>  fetchProducts () async{
  var response= await client.get(Uri.parse(Variables.baseUrl));
  if (response.statusCode==200){
    var jsonString=response.body;
    return productFromJson(jsonString);
  }
  else{
    return null;
  }

}
}