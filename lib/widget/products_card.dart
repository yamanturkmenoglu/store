import 'package:flutter/material.dart';
import 'package:store/model/products_model.dart';
import 'package:store/view/update_products.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    super.key,
    required this.productsModel,
  });
  final ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UpdateProducts(
            productsModel: productsModel,
          );
        }));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Colors.white,
            width: 180,
            height: 120,
            child: Card(
              // surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      productsModel.title.substring(0, 10),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' ' ${productsModel.price.toString()}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: -60,
            child: Image.network(
              productsModel.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
