import 'package:flutter/material.dart';
import 'package:p2w_cards/models/main_carousel_model.dart';

class ProductCarouselItem extends StatelessWidget {
  const ProductCarouselItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MainCarouselModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Image.asset(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        onTap: () {
          showAboutDialog(
            applicationName: product.title,
            context: context,
            children: [
              Row(
                children: [
                  Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.description,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          color: Theme.of(context).colorScheme.secondary,
                          child: Text(
                            'Preço: R\$ ${product.price}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.secondary,
                width: double.infinity,
                height: 10,
              ),
              Padding(
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
                    const InputFormText(
                      labelText: 'Telefone',
                    ),
                    ElevatedButton(
                      autofocus: true,
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
                  ],
                ),
              ),
            ],
          );
        },
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
