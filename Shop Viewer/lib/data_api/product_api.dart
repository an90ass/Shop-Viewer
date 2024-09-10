import "package:http/http.dart" as http;
class ProductAapi{
  static Future getProducts(){
    return http.get(Uri.parse("http://localhost:3000/products"));

  }
  static Future getProductsByCatagoryId(int catagoryId){
    return http.get(Uri.parse("http://localhost:3000/products?categoryId=$catagoryId"));


  }
}