import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/modeles/product_model.dart';
import 'package:store/service/update_produc.dart';
import 'package:store/widget/text_form_feild_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController imageController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update product ",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 140,
                ),
                TextFormFieldWidget(
                  controller: nameController,
                  label: const Text(" product title"),
                  prefixIcon: const Icon(Icons.title),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  controller: descriptionController,
                  label: const Text(" product description"),
                  prefixIcon: const Icon(Icons.description),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  label: const Text(" product price"),
                  prefixIcon: const Icon(Icons.price_change),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  controller: imageController,
                  label: const Text(" product image"),
                  prefixIcon: const Icon(Icons.image),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true ;
                        });
                       await UpdateProduct().updateProduct(
                          title: nameController.text.isEmpty ? widget.productModel.title : nameController.text,
                          price: priceController.text.isEmpty ? widget.productModel.price.toString() : priceController.text,
                          description: descriptionController.text.isEmpty ? widget.productModel.description : descriptionController.text,
                          image: imageController.text.isEmpty ?  widget.productModel.image : imageController.text,
                          category: widget.productModel.category,
                        ).then((value)
                        {
                          setState(() {
                            isLoading = false ;
                          });
                          Navigator.pop(context) ;
                        }).catchError((error)
                        {
                          print(error.toString()) ;
                        });
                        setState(() {
                          isLoading = false ;
                        });
                      },
                      color: Colors.blueAccent,
                      child: const Text("Update"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
