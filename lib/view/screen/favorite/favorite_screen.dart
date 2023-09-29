import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../home/widget/card_product.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> _lists = ['1', '2', '2', '2', '2'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.BACKGROUND,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      Images.logo,
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  const  Text(
                      'المفضلة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),

                GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (100 / 120),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: _lists.map((String value) {
                    return CardProduct();
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
