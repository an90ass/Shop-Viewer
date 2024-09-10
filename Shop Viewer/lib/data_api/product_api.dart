import "package:http/http.dart" as http;
class ProductAapi{
  static Future getProducts(){
    return http.get(Uri.parse("http://192.168.1.102:3000/products"));

  }
  static Future getProductsByCatagoryId(int catagoryId){
    return http.get(Uri.parse("http://192.168.1.102:3000/products?categoryId=$catagoryId"));


  }
}