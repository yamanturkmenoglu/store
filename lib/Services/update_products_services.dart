import 'package:store/helper/api.dart';
import 'package:store/model/products_model.dart';

class UpdateProductsService {
  Future<ProductsModel> updateProducts(
      {required String title,
      required String price,
      required String description,
      required String image,
      required int id,
      required String category}) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category
      },
    );
    return ProductsModel.fromJson(data);
  }
}
