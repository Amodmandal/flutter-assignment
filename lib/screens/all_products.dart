import 'package:flutter/material.dart';
import 'package:onlinestore/constants.dart';

import '../models/products_model.dart';
import '../services/apihandler.dart';
import '../widgets/feeds_widget.dart';

class AllproductScreen extends StatefulWidget {
  const AllproductScreen({Key? key}) : super(key: key);

  @override
  State<AllproductScreen> createState() => _AllproductScreenState();
}

class _AllproductScreenState extends State<AllproductScreen> {
  List<ProductModel> productsList = [];
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productsList = await APIhandler.getAllproducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSpiritedGreen,
      appBar: AppBar(
        backgroundColor: kDarkGreenColor,
        title: Center(child: const Text('All Products')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: productsList.isEmpty
              ? Container()
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.8),
                  itemBuilder: (ctx, index) {
                    return FeedsWidget(
                     
                      imageUrl: productsList[index].image!,
                      title: productsList[index].title.toString(),
                    );
                  }),
        ),
      ),
    );
  }
}
