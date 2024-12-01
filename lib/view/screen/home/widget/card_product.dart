import 'package:comatecs/data/model/response/product_model.dart';
import 'package:comatecs/utill/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_network/image_network.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../product_details/product_details_screen.dart';

class CardProduct extends StatefulWidget {
  final ProductModel? productModel;
  const CardProduct({Key? key,  this.productModel}) : super(key: key);

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0x7FE1E1E1)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              AppNavigation.navigateTo(context,  ProductDetailsScreen(productModel: widget.productModel,));
            },
            child: Column(
              children: [
                const Expanded(
                    child: SizedBox(
                  height: 20,
                )),
                widget.productModel==null||        widget.productModel!.productImages!.isEmpty
                    ? Image.asset(
                        'assets/images/img_1.png',
                        height: 100,
                        fit: BoxFit.contain,
                      )
                    : ImageNetwork(
                        image:
                            "https://paulamuldoon.com/wp-content/uploads/2021/06/test.jpeg?w=1024",
                        height: 120,
                        duration: 1000,
                        curve: Curves.easeIn,
                        onPointer: true,
                        debugPrint: false,
                        fullScreen: false,
                        fitAndroidIos: BoxFit.cover,
                        fitWeb: BoxFitWeb.cover,
                        borderRadius: BorderRadius.circular(12),
                        onLoading: const CircularProgressIndicator(
                          color: Colors.indigoAccent,
                        ),
                        onError: Image.asset(
                          'assets/images/logo_with_name.png',
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          AppNavigation.navigateTo(context,  ProductDetailsScreen(productModel: widget.productModel,));

                        }, width: 60,
                      ),

                //
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    widget.productModel!.name ?? '',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.productModel!.price.toString() ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF197D47),
                        fontSize: 13,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(3),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF197D47),
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(width: 0.50, color: Color(0x7FE1E1E1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: SvgPicture.asset(Images.add_cart),



                    )
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                isFavorite = !isFavorite;
                setState(() {});
              },
              child: Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: const Color(0x66F1F1F1),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.25, color: Color(0x66F1F1F1)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: SvgPicture.asset(
                      isFavorite ? Images.Heart_use : Images.Heart,
                      width: 20,
                      height: 20,
                      color: isFavorite ? ColorResources.RED : Colors.black54)),
            ),
          ),
        ],
      ),
    );
  }
}
