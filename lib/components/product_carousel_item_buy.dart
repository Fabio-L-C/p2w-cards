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
    TextEditingController nomeController = TextEditingController();
    TextEditingController cpfController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    PixFlutter pixFlutter = PixFlutter(
      payload: Payload(
        pixKey: '14813676766',
        description: product.title,
        amount: product.price.toString(),
        txid: product.id,
        merchantCity: 'Castelo',
        merchantName: 'P2W',
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        children: [
          InputFormText(
            labelText: 'Nome',
            controller: nomeController,
          ),
          InputFormText(
            labelText: 'CPF',
            controller: cpfController,
          ),
          InputFormText(
            labelText: 'E-mail',
            controller: emailController,
          ),
          ElevatedButton(
            onPressed: () {
              if (nomeController.text.isNotEmpty &&
                  cpfController.text.isNotEmpty &&
                  emailController.text.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: const Text('Código de Pagamento'),
                    contentPadding: const EdgeInsets.all(10),
                    titlePadding: const EdgeInsets.all(10),
                    children: [
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
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Preencha todos os campos'),
                    actions: [
                      TextButton(
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              }
            },
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
        ],
      ),
    );
  }
}

class InputFormText extends StatelessWidget {
  const InputFormText({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: TextField(
        controller: controller,
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
