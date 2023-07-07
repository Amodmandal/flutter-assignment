import 'dart:convert';

import 'package:http/http.dart' as http;

class APIhandler {
 static Future<void> getAllproducts() async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    print('response ${jsonDecode(response.body)}');
  }
}
