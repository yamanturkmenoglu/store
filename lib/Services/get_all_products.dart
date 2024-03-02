import 'package:store/helper/api.dart';
import 'package:store/model/products_model.dart';

class AllProductsServices {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductsModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductsModel.fromJson(data[i]));
    }

    return productsList;
  }
}
