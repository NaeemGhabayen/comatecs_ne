import 'package:comatecs/provider/adverstiment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;
import 'helper/route_helper.dart';
import 'provider/auth_provider.dart';
import 'provider/constants_provider.dart';
import 'theme/light_theme.dart';
import 'utill/app_constants.dart';
import 'view/screen/splash/splash_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ConstantsProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AdvertisementProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouteHelper.routeHelper.navigationKey,
      builder: (BuildContext context, Widget child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },
      title: AppConstants.APP_NAME,
      // navigatorKey: MyApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: light,

      locale: Locale('ar'),
      supportedLocales: [
        Locale('ar'),
      ],
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: SplashScreen(),
    );
  }
}
