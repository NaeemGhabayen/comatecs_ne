import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utill/images.dart';
import '../cart/cart_screen.dart';
import '../favorite/favorite_screen.dart';
import '../home/home_screen.dart';
import '../my_order/my_order_screen.dart';
import '../my_profile/my_profile_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  PageController pageController;
  int _index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // endDrawer: DrawerScreen(),
      bottomNavigationBar: Container(
        height: 72,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFFECECEC),
              width: 0.50,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ItemNavigation(0,
                iconData: Images.Home,
                title: "الرئيسية",
                iconDataUse: Images.Home_use),
            ItemNavigation(1,
                iconData: Images.Heart,
                title: "المفضلة",
                iconDataUse: Images.Heart_use),
            ItemNavigation(2,
                iconData: Images.cart,
                title: 'السلة',
                iconDataUse: Images.cart_use),
            ItemNavigation(3,
                iconData: Images.list,
                title: 'طلباتي',
                iconDataUse: Images.list_use),
            ItemNavigation(4,
                iconData: Images.user,
                title: 'حسابي',
                iconDataUse: Images.user_use),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      // appBar: AppBarss(context ,title),
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (item) {},
          children:const [
            HomeScreen(),
            FavoriteScreen(),
            CartScreen(),
          MyOrderScreen(),
            MyProfileScreen(
            ),
          ],
        ),
      ),
    );
  }

  Widget ItemNavigation(int indx, {iconData, title, iconDataUse}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(indx==4){
            SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).primaryColor,
              statusBarIconBrightness: Brightness.light,

            ));
          }else{
            SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ));
          }
          _index = indx;
          pageController.animateToPage(_index,
              duration: Duration(milliseconds: 50), curve: Curves.ease);
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 4,
          ),
          Center(
              child: SvgPicture.asset(
            _index == indx ? iconDataUse : iconData,
            width: 22,
            height: 22,
          )),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(
              color: _index == indx
                  ? Theme.of(context).primaryColor
                  : Color(0x66212121),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
