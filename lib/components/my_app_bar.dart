import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.controller,
    required this.isScrolled,
  }) : super(key: key);

  final ScrollController controller;
  final bool isScrolled;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: isScrolled ? 1 : 2),
      curve: Curves.fastLinearToSlowEaseIn,
      color: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: isScrolled ? 100 : 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            child: Text(
              'P2W Cards',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: isScrolled ? 40 : 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              controller.animateTo(
                0,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              );
            },
          ),
          TextButton(
            child: Text(
              'Keys',
              style: TextStyle(fontSize: isScrolled ? 20 : 15),
            ),
            onPressed: () {
              controller.animateTo(
                350,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              );
            },
          ),
          TextButton(
            child: Text(
              'Gift Cards',
              style: TextStyle(fontSize: isScrolled ? 20 : 15),
            ),
            onPressed: () {
              controller.animateTo(
                700,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
