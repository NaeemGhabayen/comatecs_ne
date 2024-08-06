import 'package:comatecs/data/model/response/product_model.dart';
import 'package:comatecs/provider/product_provider.dart';
import 'package:comatecs/view/base/card_counter.dart';
import 'package:comatecs/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_network/image_network.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../home/widget/card_product.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetailsScreen({Key key, this.productModel}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedImage = 0;
  bool isFavorite = false;
  List<String> _lists = ['1', '2', '2', '2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.06),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .3,
                          width: MediaQuery.of(context).size.width,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Hero(
                              tag: 1,
                              child: ImageNetwork(
                                image:
                                    "https://paulamuldoon.com/wp-content/uploads/2021/06/test.jpeg?w=1024",
                                duration: 200,
                                curve: Curves.easeIn,
                                fitAndroidIos: BoxFit.fill,
                                fitWeb: BoxFitWeb.fill,
                                borderRadius: BorderRadius.circular(8),
                                onLoading: const CircularProgressIndicator(
                                  color: Colors.indigoAccent,
                                ),
                                onError: Image.asset(
                                  'assets/images/logo_with_name.png',
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10.0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              ...List.generate(
                                  widget.productModel.productImages.length + 2,
                                  (index) {
                                return buildSmallProductPreview(index);
                              }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: ShapeDecoration(
                              color: Color(0x66F1F1F1),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.25, color: Color(0x66F1F1F1)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 20,
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Container(
                              width: 36,
                              height: 36,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: Color(0x66F1F1F1),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.25, color: Color(0x66F1F1F1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: SvgPicture.asset(
                                  isFavorite ? Images.Heart_use : Images.Heart,
                                  width: 20,
                                  height: 20,
                                  color: isFavorite
                                      ? ColorResources.RED
                                      : Colors.black54)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productModel.name ?? '',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${widget.productModel.price} JOD',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF197D47),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              '${widget.productModel.price} JOD',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0x7F212121),
                                fontSize: 13,
                                fontFamily: 'Efrea',
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              '${widget.productModel.discountValue}%',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFE25440),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        CardCounter(),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      widget.productModel.details ?? '',
                      style: const TextStyle(
                        color: Color(0x99212121),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 3,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(
                          color: Color(0xFFE1E1E1),
                        )),
                    const Text(
                      'مميزات :',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'لا يولد المحرك بدون فرش الشرر عندما يعمل ، ولا يرتدي المحرك.',
                            style: TextStyle(
                              color: Color(0x99212121),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(
                          color: Color(0xFFE1E1E1),
                        )),
                    const Text(
                      'مرفقات :',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'كتيب نموذج العمل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xCC212121),
                                  fontSize: 12,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Image.asset(
                                      Images.download,
                                      width: 16,
                                      height: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    'تحميل',
                                    style: TextStyle(
                                      color: Color(0xFF197D47),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(
                          color: Color(0xFFE1E1E1),
                        )),
                    const Text(
                      'التسليم :',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'التوصيل :',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xCC212121),
                              fontSize: 12,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Text(
                            '${widget.productModel.deliveryPrice} JOD',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF212121),
                              fontSize: 16,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w500,
                              height: 0.08,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'التسليم :',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xCC212121),
                              fontSize: 12,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Text(
                            widget.productModel.deliveryDuration,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF212121),
                              fontSize: 16,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w500,
                              height: 0.08,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(
                          color: Color(0xFFE1E1E1),
                        )),
                    const Text(
                      'منتجات مشابهة',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF197D47),
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * .25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _lists.length,
                          // list item builder
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                                margin: EdgeInsets.only(left: 16),
                                width: MediaQuery.of(context).size.width * .43,
                                child: CardProduct(
                                  productModel: widget.productModel,
                                ));
                          },
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: CustomButton(
                              btnTxt: 'أضف إلى السلة',
                              onTap: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 53,
                          height: 48,
                          padding: EdgeInsets.all(8),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFE1E1E1)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: SvgPicture.asset(
                            Images.cart,
                            width: 24,
                            height: 24,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      child: AnimatedContainer(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: selectedImage == index
              ? Colors.black.withOpacity(0.10000000149011612)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(selectedImage == index ? 1 : 0)),
        ),
        duration: const Duration(milliseconds: 500),
        child: ImageNetwork(
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjj5dy27c9QgPgYlQA8rvce4xdYMxD86AaFA&s",
          curve: Curves.easeIn,
          fitAndroidIos: BoxFit.cover,
          fitWeb: BoxFitWeb.cover,
          onTap: () {
            setState(() {
              selectedImage = index;
            });
          },
          borderRadius: BorderRadius.circular(8),
          onError: Image.asset(
            'assets/images/logo_with_name.png',
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
