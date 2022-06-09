import 'package:flutter/material.dart';
import 'package:p2w_cards/models/main_carousel_model.dart';
import 'package:pix_flutter/pix_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProductCarouselItemBuy extends StatelessWidget {
  const ProductCarouselItemBuy({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MainCarouselModel product;

  @override
  Widget build(BuildContext context) {
    PixFlutter pixFlutter = PixFlutter(
      payload: Payload(
        pixKey: '123456789',
        description: product.title,
        amount: product.price.toString(),
        txid: product.id,
        merchantCity: 'New York',
        merchantName: 'P2W',
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        children: [
          const InputFormText(
            labelText: 'Nome',
          ),
          const InputFormText(
            labelText: 'CPF',
          ),
          const InputFormText(
            labelText: 'E-mail',
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'COMPRAR',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              alignment: Alignment.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            width: 400,
            height: 400,
            color: Colors.amber,
            child: QrImage(
              data: pixFlutter.getQRCode(),
              // data: 'Gomu Gomu no MI',
              size: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class InputFormText extends StatelessWidget {
  const InputFormText({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          labelText: labelText,
          floatingLabelStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
