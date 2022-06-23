import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:p2w_cards/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:p2w_cards/utils/constants.dart';

class AdmOrder with ChangeNotifier {
  final List<Order> _orderList = [];

  List<Order> get orderList => [..._orderList];

  int get orderListCount => _orderList.length;

  loadOrder() async {
    // _orderList.clear();

    final response = await http.get(Uri.parse(ORDER_URL));
    if (response.body == 'null') return;
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    extractedData.forEach(
      (key, value) {
        if (_orderList.length < extractedData.length) {
          _orderList.add(
            Order(
              idPessoa: value['idPessoa'],
              nomePessoa: value['nomePessoa'],
              emailPessoa: value['emailPessoa'],
              cpfPessoa: value['cpfPessoa'],
              idJogo: value['idJogo'],
              nomeJogo: value['nomeJogo'],
              price: value['price'],
            ),
          );
        }
      },
    );
    notifyListeners();
  }
}
