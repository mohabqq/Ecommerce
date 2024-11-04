import 'package:store/modeles/product_model.dart';
import 'package:store/network/api.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProduct({
    required String categoryName,
  }) async {
    List<dynamic> data = await Api().getData(
        url: "https://fakestoreapi.com/products/category/$categoryName");
    List<ProductModel> productCategoriesData = [];

    for (int i = 0; i < data.length; i++) {
      productCategoriesData.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productCategoriesData;
  }
}
