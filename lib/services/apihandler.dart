import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onlinestore/models/products_model.dart';

class APIhandler {
  static Future<List<ProductModel>> getAllproducts() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    // print('response ${jsonDecode(response.body)}');
    var data = jsonDecode(response.body);
    List tempList = [];
    if (response.statusCode != 200) {
      throw data["message"];
    }
    for (var v in data) {
      tempList.add(v);
      // print("V $v \n\n");
    }
    return ProductModel.productsFromSnapshot(tempList);
  }
}
