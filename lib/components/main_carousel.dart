import 'package:flutter/material.dart';
import 'package:p2w_cards/models/products.dart';

class MainCarousel extends StatelessWidget {
  const MainCarousel({
    Key? key,
    required this.productsModel,
  }) : super(key: key);

  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5 - 100,
          child: Image.asset(
            productsModel.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
