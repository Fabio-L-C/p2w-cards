import 'package:flutter/material.dart';
import 'package:p2w_cards/components/product_carousel_item.dart';
import 'package:p2w_cards/data/main_carousel_data.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: MAIN_CAROUSEL_LIST.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCarouselItem(
            product: MAIN_CAROUSEL_LIST[index],
          );
        },
      ),
    );
  }
}
