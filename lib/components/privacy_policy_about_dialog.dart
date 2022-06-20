// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:p2w_cards/models/privacy_policy.dart';
import 'package:p2w_cards/models/privacy_policy_list.dart';
import 'package:provider/provider.dart';

class PrivacyPolicyAboutDialog extends StatefulWidget {
  const PrivacyPolicyAboutDialog({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyAboutDialog> createState() =>
      _PrivacyPolicyAboutDialogState();
}

class _PrivacyPolicyAboutDialogState extends State<PrivacyPolicyAboutDialog> {
  late String language;

  @override
  Widget build(BuildContext context) {
    final politica = Provider.of<PrivacyPolicyList>(context, listen: false);
    language = politica.privacyPolicyList[0].content;

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
                politica.privacyPolicyCount,
                (index) => ContainerCountry(politica.privacyPolicyList[index]),
              ),
            ),
          ),
          const SizedBox(height: 40),
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
