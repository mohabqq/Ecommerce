//
// import 'dart:convert';
//
// import 'package:store/modeles/product_model.dart';
// import 'package:http/http.dart' as http;
//
// class AllProductService {
//   Future<List<ProductModel>> getAllProduct() async {
//     http.Response response =
//         await http.get(Uri.parse("https://fakestoreapi.com/products"));
//     List<dynamic> data = jsonDecode(response.body);
//     List<ProductModel> productData = [];
//
//     for (int i = 0; i < data.length; i++) {
//       productData.add(
//         ProductModel.fromJson(data[i]),
//       );
//     }
//     return productData;
//   }
// }
import 'package:store/modeles/product_model.dart';
import 'package:store/network/api.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().getData(url: "https://fakestoreapi.com/products");
    List<ProductModel> productData = [];

    for (int i = 0; i < data.length; i++) {
      productData.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productData;
  }
}
