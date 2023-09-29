import 'package:flutter/material.dart';

class AppNavigation {
  static void navigateTo(context, widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => widget,
        ),
      );

  static void navigateAndFinish(context, widget) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => widget,
        ),
        (Route<dynamic> route) {
          return false;
        },
      );

  static void navigateAndReplace(context, widget) =>
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => widget,
        ),
      );

  static void signOut(context) async {
    // await CacheHelper.clearData(
    //   key: 'token',
    // );
    // if (CacheHelper.getData(key: "userType") == "seller") {
    //   await clearUserCache();
    // }
    // navigateAndFinish(context, const LoginScreen());

    // await DioHelper.getData(
    //   url: EndPoints.logout,
    //   token: CacheHelper.getData(key: 'token'),
    // ).then((value) {});
  }


}
