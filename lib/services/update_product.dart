import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required dynamic price,
    required String des,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().put(url: "https://fakestoreapi.com/products/$id", body: {
      "title": title,
      "price": price,
      "description": des,
      "image": image,
      "category": category,
    });
    return ProductModel.fromJson(data);
  }
}
