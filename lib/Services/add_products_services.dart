import 'package:store/helper/api.dart';
import 'package:store/model/products_model.dart';

class AddProductsService {
  Future<ProductsModel> addProducts(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
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
