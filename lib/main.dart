import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p2w_cards/adm/adm_order.dart';
import 'package:p2w_cards/adm/adm_page.dart';
import 'package:p2w_cards/models/privacy_policy_list.dart';
import 'package:p2w_cards/models/products_list.dart';
import 'package:p2w_cards/pages/home_page.dart';
import 'package:p2w_cards/utils/app_routes.dart';
import 'package:p2w_cards/utils/app_scroll.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => PrivacyPolicyList(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdmOrder(),
        ),
      ],
      child: MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'P2W Cards',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.white,
            secondary: Colors.black,
          ),
        ),
        // home: const HomePage(),
        // home: const AdmPage(),
        routes: {
          AppRoutes.HOME_PAGE: (ctx) => const HomePage(),
          AppRoutes.ADM_PAGE: (ctx) => const AdmPage(),
        },
      ),
    );
  }
}
