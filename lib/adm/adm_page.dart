import 'package:flutter/material.dart';
import 'package:p2w_cards/adm/adm_order.dart';
import 'package:p2w_cards/adm/adm_painel.dart';
import 'package:provider/provider.dart';

class AdmPage extends StatelessWidget {
  const AdmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AdmOrder>(context).loadOrder();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('PAINEL DE ADM'),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: AdmPainel(),
        ),
      ),
    );
  }
}
