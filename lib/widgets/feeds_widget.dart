import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinestore/screens/product%20_details.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProductDetails()));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: const TextSpan(
                            text: '\$',
                            style: TextStyle(
                                color: Color.fromRGBO(33, 150, 243, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "168.00",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600)),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FancyShimmerImage(
                      height: size.height * 0.2,
                      width: double.infinity,
                      errorWidget: const Icon(
                        IconlyBold.danger,
                        color: Colors.red,
                        size: 28,
                      ),
                      imageUrl: imageUrl,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 17,
                    //  fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
