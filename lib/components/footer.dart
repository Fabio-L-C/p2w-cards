import 'package:flutter/material.dart';
import 'package:p2w_cards/components/privacy_policy_button.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        right: 10,
        left: 10,
      ),
      width: double.infinity,
      height: 150,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'P2W Cards',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Gift Cards e Keys',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 13,
            ),
          ),
          MediaQuery.of(context).size.width > 600
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Termos e Condições',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                      ),
                    ),
                    const PrivacyPolicyButton(
                      fontSize: 20,
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Termos e Condições',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 13,
                      ),
                    ),
                    const PrivacyPolicyButton(
                      fontSize: 13,
                    ),
                  ],
                ),
          Text(
            'P2W © 2022',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
