import 'package:flutter/material.dart';
import 'package:p2w_cards/components/main_carousel.dart';
import 'package:p2w_cards/data/main_carousel_data.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/img/logo_02.png'),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2,
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.5 - 96,
              height: MediaQuery.of(context).size.height * 0.5,
              child: PageView.builder(
                itemCount: MAIN_CAROUSEL_LIST.length,
                itemBuilder: (context, index) => MainCarousel(
                  mainCarouselModel: MAIN_CAROUSEL_LIST[index],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
