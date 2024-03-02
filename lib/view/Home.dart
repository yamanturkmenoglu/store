import 'package:flutter/material.dart';
import 'package:store/Services/get_all_products.dart';
import 'package:store/model/products_model.dart';
import 'package:store/widget/products_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text(
          'New Trend',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_basket_outlined,
              size: 30,
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 90.0, left: 20),
          child: FutureBuilder<List<ProductsModel>>(
              future: AllProductsServices().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductsModel> products = snapshot.data!;
                  return GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return ProductsCard(
                          productsModel: products[index],
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
