import 'package:flutter/material.dart';
import 'package:p2w_cards/components/privacy_policy_about_dialog.dart';
import 'package:p2w_cards/models/privacy_policy_list.dart';
import 'package:provider/provider.dart';

class PrivacyPolicyButton extends StatefulWidget {
  const PrivacyPolicyButton({
    Key? key,
    required this.fontSize,
  }) : super(key: key);
  final double fontSize;

  @override
  State<PrivacyPolicyButton> createState() => _PrivacyPolicyButtonState();
}

class _PrivacyPolicyButtonState extends State<PrivacyPolicyButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'Política de Privacidade',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: widget.fontSize,
          decoration: isHover ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
      onHover: (value) => setState(() => isHover = value),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const SimpleDialog(
            title: Text('Política de Privacidade'),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            titlePadding: EdgeInsets.all(10),
            children: [
              PrivacyPolicyAboutDialog(),
            ],
          ),
        );
      },
    );
  }
}
