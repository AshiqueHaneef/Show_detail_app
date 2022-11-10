import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>?> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        // Fluttertoast.showToast(msg: "Failed to load");
        print("failed to load");
      }
    } catch (e) {
      print(e);
      return Future.value([]);
    }
    return null;
  }
}
