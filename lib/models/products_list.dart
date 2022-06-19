import 'package:flutter/material.dart';
import 'package:p2w_cards/data/main_products_data.dart';
import 'package:p2w_cards/models/products.dart';

class ProductsList with ChangeNotifier {
  final List<ProductsModel> _productsList = mainProductsData;

  List<ProductsModel> get productsList {
    return [..._productsList];
  }

  int get productsCount {
    return _productsList.length;
  }
}
