import 'dart:async';
import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/screen/main_home/main_home_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../provider/adverstiment_provider.dart';
import '../../../provider/auth_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';

import 'dart:io' show Platform;

import '../auth/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  @override
  void initState() {
    super.initState();
    bool _firstTime = true;
    _onConnectivityChanged = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      Provider.of<AuthProvider>(context, listen: false).isRememberMe();
      if (!_firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
        isNotConnected
            ? SizedBox()
            : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
            isNotConnected
                ? 'no_connection'
                : 'connected',
            textAlign: TextAlign.center,
          ),
        ));
        if (!isNotConnected) {
          _route();
        }
      }
      _firstTime = false;
    });

    _route();
  }

  @override
  void dispose() {
    super.dispose();

    _onConnectivityChanged.cancel();
  }

  void _route() async {

    Timer(Duration(seconds: 5), () {
      if(Provider.of<AuthProvider>(context, listen: false).isRemember){
        Provider.of<AdvertisementProvider>(context, listen: false).getAdvertisementList(context);
        AppNavigation.navigateAndFinish(context, MainHomeScreen());
      }else{
        AppNavigation.navigateAndFinish(context, LoginScreen());
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      // key: _globalKey,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.logo_with_name,
              fit: BoxFit.contain,
            ),
            Container(
              width: 25,
              height: 25,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
