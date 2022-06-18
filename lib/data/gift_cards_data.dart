import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:p2w_cards/data/main_carousel_data.dart';
import 'package:p2w_cards/utils/constants.dart';

class GiftCardData {
  static void saveGiftCard() async {
    for (var element in MAIN_CAROUSEL_LIST) {
      await http.post(
        Uri.parse('$BASE_URL/products.json'),
        body: jsonEncode(
          {
            'id': element.id,
            'imageUrl': element.imageUrl,
            'title': element.title,
            'description': element.description,
            'price': element.price,
          },
        ),
      );
    }
  }
}
