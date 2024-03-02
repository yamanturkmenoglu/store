import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/Services/update_products_services.dart';
import 'package:store/model/products_model.dart';
import 'package:store/widget/button.dart';
import 'package:store/widget/textfild.dart';

// ignore: must_be_immutable
class UpdateProducts extends StatefulWidget {
  const UpdateProducts({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  State<UpdateProducts> createState() => _UpdateProductsState();
}

class _UpdateProductsState extends State<UpdateProducts> {
  String? pruductsname, desc, image;

  String? price;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Update Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CusttomTextFild(
                onChanged: (data) {
                  pruductsname = data;
                },
                hinttitle: widget.productsModel.title,
              ),
              const SizedBox(
                height: 20,
              ),
              CusttomTextFild(
                onChanged: (data) {
                  desc = data;
                },
                hinttitle: 'description',
              ),
              const SizedBox(
                height: 20,
              ),
              CusttomTextFild(
                keyboardType: TextInputType.number,
                onChanged: (data) {
                  price = data;
                },
                hinttitle: 'price',
              ),
              const SizedBox(
                height: 20,
              ),
              CusttomTextFild(
                onChanged: (data) {
                  image = data;
                },
                hinttitle: 'image',
              ),
              const SizedBox(
                height: 50,
              ),
              CusttomButton(
                title: 'Update',
                ontap: () async {
                  isloading = true;
                  setState(() {});
                  try {
                    await UpdateProduct();
                    print('succses');
                  } catch (e) {
                    print(e.toString());
                  }
                  isloading = false;
                  setState(() {});
                },
              )
            ],
          )),
    );
  }

  Future<void> UpdateProduct() async {
    await UpdateProductsService().updateProducts(
        title:
            pruductsname == null ? widget.productsModel.title : pruductsname!,
        price: price == null ? widget.productsModel.price.toString() : price!,
        description: desc == null ? widget.productsModel.description : desc!,
        image: image == null ? widget.productsModel.image : image!,
        category: widget.productsModel.category,
        id: widget.productsModel.id);
  }
}
