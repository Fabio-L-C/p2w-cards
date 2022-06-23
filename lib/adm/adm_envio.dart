import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:p2w_cards/models/order.dart';

class AdmEnvio {
  static enviar(Order order) async {
    const String url = 'https://incognito-wingnuts.000webhostapp.com/';
    try {
      http.post(
        Uri.parse(url),
        body: jsonEncode(
          {
            "nome": order.nomePessoa,
            "email": order.emailPessoa,
            "produto": order.nomeJogo,
            "preco": "${order.price}",
          },
        ),
      );
    } catch (e) {
      // print(e);
    }
  }
}
