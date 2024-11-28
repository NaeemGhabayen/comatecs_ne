import 'package:comatecs/provider/adverstiment_provider.dart';
import 'package:comatecs/provider/categories_provider.dart';
import 'package:comatecs/provider/product_provider.dart';
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
      ChangeNotifierProvider(create: (context) => di.sl<CategoriesProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProductProvider>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouteHelper.routeHelper.navigationKey,
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      title: AppConstants.APP_NAME,
      // navigatorKey: MyApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: light,

      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
      ],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}
