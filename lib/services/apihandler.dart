import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:onlinestore/models/products_model.dart';

class APIhandler {
  static Future<List<ProductModel>> getAllproducts() async {
    try {
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
      }
      return ProductModel.productsFromSnapshot(tempList);
    } catch (error) {
      log('An error occured $error');
      throw error.toString();
    }
  }

  static Future<ProductModel> getproductsbyID({required String id}) async {
    try {
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
      // print('response ${jsonDecode(response.body)}');
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }
      return ProductModel.fromJson(data);
    } catch (error) {
      log('An error occured  while getting product information $error');
      throw error.toString();
    }
  }
}
