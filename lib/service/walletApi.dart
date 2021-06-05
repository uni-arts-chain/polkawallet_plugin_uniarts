import 'dart:convert';

import 'package:http/http.dart' as http;

class WalletApi {
  static const String _endpoint = 'https://api.polkawallet.io';

  static Future<Map> getRecommended() async {
    try {
      var uri = Uri.parse("$_endpoint/recommended.json");
      var res = await http.get(uri);
      if (res == null) {
        return null;
      } else {
        return jsonDecode(res.body) as Map;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }
}
