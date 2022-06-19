import 'package:flutter/material.dart';
import 'package:p2w_cards/components/product_carousel_item.dart';
import 'package:p2w_cards/models/products_list.dart';
import 'package:provider/provider.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsList>(context);

    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: products.productsCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCarouselItem(
            product: products.productsList[index],
          );
        },
      ),
    );
  }
}
