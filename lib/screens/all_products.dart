import 'package:flutter/material.dart';
import 'package:onlinestore/constants.dart';
import '../widgets/feeds_widget.dart';

class AllproductScreen extends StatelessWidget {
  const AllproductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: kSpiritedGreen,
      appBar: AppBar(
         backgroundColor: kDarkGreenColor,
        title: Center(child: const Text('All Products')),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 8,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 0.8),
                          itemBuilder: (ctx, index) {
                            return const FeedsWidget();
                          }),
      ),
    );
  }
}
