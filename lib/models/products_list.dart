import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:p2w_cards/models/products.dart';
import 'package:p2w_cards/utils/constants.dart';

class ProductsList with ChangeNotifier {
  // final List<ProductsModel> _productsList = mainProductsData;
  final List<ProductsModel> _productsList = [];

  List<ProductsModel> get productsList {
    return [..._productsList];
  }

  int get productsCount {
    return _productsList.length;
  }

  loadProducts() async {
    final response = await http.get(Uri.parse(PRODUCTS_URL));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((key, value) {
      _productsList.add(ProductsModel(
        id: key,
        title: value['title'],
        description: value['description'],
        price: value['price'],
        imageUrl: value['imageUrl'],
      ));
    });
    notifyListeners();
  }
}


  // addProducts() {
  //   _productsList.add(
  //     ProductsModel(
  //       id: '01',
  //       imageUrl: 'assets/img/img_01.jpg',
  //       title: 'GTA V',
  //       description:
  //           'Grand Theft Auto V é um jogo eletrônico de ação-aventura desenvolvido pela Rockstar North e publicado pela Rockstar Games.',
  //       price: 11.0,
  //     ),
  //   );
  // }