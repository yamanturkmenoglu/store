
import 'package:store/helper/api.dart';
import 'package:store/model/products_model.dart';

class CategoryProductsService {
  Future<List<ProductsModel>> getCategoryProducts(
      {required String CategoryName}) async {
    List<dynamic> data = await Api()
        // ignore: missing_required_param
        .get(url: 'https://fakestoreapi.com/products/category/$CategoryName');

    List<ProductsModel> categoryProducts = [];
    for (var i = 0; i < data.length; i++) {
      categoryProducts.add(ProductsModel.fromJson(data[i]));
    }
    return categoryProducts;
  }
}
