import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:p2w_cards/utils/constants.dart';

class Order {
  final String idPessoa;
  final String nomePessoa;
  final String emailPessoa;
  final String cpfPessoa;
  final String idJogo;
  final String nomeJogo;
  final double price;

  Order({
    required this.idPessoa,
    required this.nomePessoa,
    required this.emailPessoa,
    required this.cpfPessoa,
    required this.idJogo,
    required this.nomeJogo,
    required this.price,
  });

  saveOrder() async {
    http.post(
      Uri.parse(ORDER_URL),
      body: jsonEncode(
        {
          'idPessoa': idPessoa,
          'nomePessoa': nomePessoa,
          'emailPessoa': emailPessoa,
          'cpfPessoa': cpfPessoa,
          'idJogo': idJogo,
          'nomeJogo': nomeJogo,
          'price': price,
        },
      ),
    );
  }
}
