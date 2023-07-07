import 'package:flutter/foundation.dart';

class ProductModel with ChangeNotifier{
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
 

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
     });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price']?.toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    
  }
  static List<ProductModel> productsFromSnapshot(List productSnaphot) {
     print("data ${productSnaphot[3]}");
    return productSnaphot.map((data) {
      return ProductModel.fromJson(data);
    }).toList();
  }
  
}


