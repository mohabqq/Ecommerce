import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/modeles/product_model.dart';
import 'package:store/service/AllProductService.dart';
import 'package:store/widget/card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "New Trend ",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            )
          ],
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
          elevation: 0.0,
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical:60),
          child: FutureBuilder<List<ProductModel>>(
              future: AllProductService().getAllProduct()  ,
              builder: (context , snapshot)
              {
                if(snapshot.hasData)
                {
                  List<ProductModel> product = snapshot.data! ;
                  return GridView.builder(
                    itemCount: product.length,
                    clipBehavior: Clip.none,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:1.2 ,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 80
                    ) ,
                    itemBuilder:  (context , index)=>  CardWidget(productModel: product[index],),
                    physics:const BouncingScrollPhysics(),
                  ) ;
                }else
                {
                  return const Center(child: CircularProgressIndicator(),) ;
                }
              })
        ) ,
    );
  }
}

