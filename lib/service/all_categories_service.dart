import 'package:store/network/api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api()
        .getData(url: "https://fakestoreapi.com/products/categories");

    return data;
  }
}
