import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import 'cancel_orders/cancel_orders_screen.dart';
import 'complete_orders/complete_orders_screen.dart';
import 'current_orders/current_orders_screen.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  PageController pageController;
  int initialPage = 0;
  int _index = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(
      initialPage: initialPage,
    );
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.BACKGROUND,
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
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
                  const  SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'طلباتي',
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
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 48,
                padding: EdgeInsets.only(top: 5,bottom: 5),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFE1E1E1)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildItemReq(0, "الحالية", ),
                    buildItemReq(1, "الملغية", ),
                    buildItemReq(2, "المكتملة", ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (item) {
                    setState(() {
                      _index = item;
                      print(_index);
                      print("_index");

                      setState(() {

                      });
                    });
                  },
                  children:  [
                    CurrentOrdersScreen(),
                    CancelOrdersScreen(),
                    CompleteOrdersScreen(),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }

  Widget buildItemReq(int inde, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _index = inde;
          pageController.animateToPage(_index, duration: Duration(milliseconds: 100), curve: Curves.ease);
        });
      },
      child: inde == _index
          ? Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 8),
          decoration: ShapeDecoration(
            color: Color(0xFF197D47),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
          : Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xB26F6F6F),
          fontSize: 15,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

}
