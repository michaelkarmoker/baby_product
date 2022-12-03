import 'package:baby_product/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/get_di.dart';
import 'theme/light_theme.dart';
import 'view/screen/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {





  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context);

    return GetMaterialApp(
      title: AppConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme:light,
      home: SplashScreen(),
      defaultTransition: Transition.topLevel,
      transitionDuration: Duration(milliseconds: 500),


    );
  }
}


