import 'package:http/http.dart' as http;
class CategoryApi{
  static Future getCatagories(){
    return http.get(Uri.parse("http://localhost:3000/categories"));
}
  static Future getCategoryById(int id) {
    return http.get(Uri.parse("http://localhost:3000/categories?id=$id"));
  }
}