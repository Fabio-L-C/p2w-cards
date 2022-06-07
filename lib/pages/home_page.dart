import 'package:flutter/material.dart';
import 'package:p2w_cards/components/body.dart';
import 'package:p2w_cards/components/footer.dart';
import 'package:p2w_cards/components/header.dart';
import 'package:p2w_cards/components/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  bool isScrolled = true;

  _scrollListener() {
    if (_controller.offset <= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        isScrolled = false;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        isScrolled = true;
      });
    }
  }

  @override
  void initState() {
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        controller: _controller,
        isScrolled: isScrolled,
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: const [
            BlackLine(),
            Header(),
            BlackLine(),
            Body(),
            BlackLine(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class BlackLine extends StatelessWidget {
  const BlackLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.secondary,
      width: double.infinity,
      height: 10,
    );
  }
}
