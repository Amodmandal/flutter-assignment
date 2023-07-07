import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinestore/constants.dart';
import 'package:onlinestore/screens/all_products.dart';
import 'package:onlinestore/widgets/feeds_widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSpiritedGreen,
      appBar: AppBar(
        backgroundColor: kDarkGreenColor,
        title: const Center(
          child: Text(
            'Home',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All products',
                    style: TextStyle(fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllproductScreen()));;
                    },
                    child: const Text(
                      'View all',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
