import 'package:flutter/material.dart';
import 'package:store/modeles/product_model.dart';
import 'package:store/screen/update_product_screen.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UpdateProductScreen(
                      productModel: productModel,
                    )));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            width: 260,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey,
                  spreadRadius: 0,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${productModel.price}",
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 110,
            left: 50,
            child: Image(
              image: NetworkImage(productModel.image),
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}
