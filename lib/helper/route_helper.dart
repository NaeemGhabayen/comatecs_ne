import 'package:flutter/material.dart';

class RouteHelper {
  RouteHelper._();
  static RouteHelper routeHelper = RouteHelper._();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  // goToPage(String routeName) {
  //   navigationKey.currentState.pushNamed(routeName);
  // }

  // goAndReplacePage(String routeName) {
  //   navigationKey.currentState.pushReplacementNamed(routeName);
  // }

  goBack() {
    navigationKey.currentState.pop();
  }

  showDialoug() {
    return showDialog(
        context: navigationKey.currentContext,
        builder: (ctx) {
          return Center(
            child: Image.asset(
              'assets/images/loading.gif',
              height: 50,
              width: 50,
            ),
          );
        });
  }
}
