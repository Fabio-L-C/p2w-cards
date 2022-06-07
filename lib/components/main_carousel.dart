import 'package:flutter/material.dart';
import 'package:p2w_cards/models/main_carousel_model.dart';

class MainCarousel extends StatelessWidget {
  const MainCarousel({
    Key? key,
    required this.mainCarouselModel,
  }) : super(key: key);

  final MainCarouselModel mainCarouselModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5 - 100,
          child: Image.asset(
            mainCarouselModel.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
