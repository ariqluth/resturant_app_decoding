import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:resturant_app2/data/response_resturant.dart';

class Api {
  static const String PATH = 'lib/media/json/local_restaurant.json';

  static Future<ResponseRestaurant> getData() async {
    return ResponseRestaurant.fromJson(
        await rootBundle.loadString(PATH).then((value) => jsonDecode(value)));
  }
}
