// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:p2w_cards/models/privacy_policy.dart';
import 'package:p2w_cards/utils/privacy_policy_text.dart';

class PrivacyPolicyAboutDialog extends StatefulWidget {
  const PrivacyPolicyAboutDialog({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyAboutDialog> createState() =>
      _PrivacyPolicyAboutDialogState();
}

class _PrivacyPolicyAboutDialogState extends State<PrivacyPolicyAboutDialog> {
  late String language;

  @override
  void initState() {
    super.initState();
    language = POLITICA_DE_PRIVACIDADE[0].content;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: Column(
        children: [
          Container(
            color: const Color.fromARGB(20, 0, 0, 0),
            height: 200,
            width: 800,
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(
                POLITICA_DE_PRIVACIDADE.length,
                (index) => ContainerCountry(POLITICA_DE_PRIVACIDADE[index]),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Text(
            language,
            textAlign: TextAlign.justify,
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }

  InkWell ContainerCountry(PrivacyPolicy privacyPolicy) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Image.network(
              privacyPolicy.countryFlagUrl,
            ),
          ),
          Text(privacyPolicy.language),
        ],
      ),
      onTap: () {
        setState(() {
          language = privacyPolicy.content;
        });
      },
    );
  }
}
