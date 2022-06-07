import 'package:flutter/material.dart';
import 'package:p2w_cards/components/privacy_policy_about_dialog.dart';

class PrivacyPolicButton extends StatefulWidget {
  const PrivacyPolicButton({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicButton> createState() => _PrivacyPolicButtonState();
}

class _PrivacyPolicButtonState extends State<PrivacyPolicButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextButton(
        child: Text(
          'Política de Privacidade',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
            decoration:
                isHover ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
        onHover: (value) => setState(() => isHover = value),
        onPressed: () {
          showAboutDialog(
            applicationName: 'P2W Cards',
            context: context,
            children: [
              const PrivacyPolicyAboutDialog(),
            ],
          );
        },
      ),
    );
  }
}
