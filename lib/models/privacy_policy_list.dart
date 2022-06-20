import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:p2w_cards/models/privacy_policy.dart';
import 'package:p2w_cards/utils/constants.dart';

class PrivacyPolicyList with ChangeNotifier {
  // final List<PrivacyPolicy> _privacyPolicyList = POLITICA_DE_PRIVACIDADE;
  final List<PrivacyPolicy> _privacyPolicyList = [];

  List<PrivacyPolicy> get privacyPolicyList => _privacyPolicyList;

  int get privacyPolicyCount => _privacyPolicyList.length;

  savePolicy() async {
    for (var element in _privacyPolicyList) {
      http.post(
        Uri.parse(POLICY_URL),
        body: jsonEncode(
          {
            'id': element.id,
            'language': element.language,
            'countryFlagUrl': element.countryFlagUrl,
            'content': element.content,
          },
        ),
      );
    }
  }

  loadPolicy() async {
    final response = await http.get(Uri.parse(POLICY_URL));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    extractedData.forEach(
      (key, value) {
        _privacyPolicyList.add(
          PrivacyPolicy(
            id: key,
            language: value['language'],
            countryFlagUrl: value['countryFlagUrl'],
            content: value['content'],
          ),
        );
      },
    );
  }
}
