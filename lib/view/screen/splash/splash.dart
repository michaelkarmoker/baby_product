import 'package:baby_product/controller/auth_controller.dart';
import 'package:baby_product/view/screen/auth/signIn.dart';
import 'package:baby_product/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';


import 'package:get/get.dart';

import 'dart:async';





class SplashScreen extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<SplashScreen> {

 // GlobalKey<ScaffoldState> _globalKey = GlobalKey();
 // late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  @override
  void initState() {
    super.initState();


    // bool _firstTime = true;
    // _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if(!_firstTime) {
    //     bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
    //     isNotConnected ? SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       backgroundColor: isNotConnected ? Colors.red : Colors.green,
    //       duration: Duration(seconds: isNotConnected ? 6000 : 3),
    //       content: Text(
    //         isNotConnected ? 'no_connection'.tr : 'connected'.tr,
    //         textAlign: TextAlign.center,
    //       ),
    //     ));
    //     if(!isNotConnected) {
    //       _route();
    //     }
    //   }
    //   _firstTime = false;
    // });


 //   Get.find<SplashController>().initSharedData();
    _route();
  }

  @override
  Widget build(BuildContext context) {
   // _controller!.forward();
    return  Scaffold(

        body:Container(

            child:Center(
              child:Container(
                height: Get.height/3.5,
                child: FadeIn(
                  child: Image.asset("assets/image/logo.png"),
                  // Optional paramaters
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
              )
            )

        ));
  }
  @override
  void dispose() {
    // TODO: implement dispose
   // _controller!.dispose();
    super.dispose();
  }
  void _route() {


    Timer(Duration(seconds: 1), () async {
      if(Get.find<AuthController>().isLoggedIn()){

        Get.offAll(Home());
      }else{
        Get.offAll(SignIn(exitFromApp: true));
      }

     // Get.to(SignIn(exitFromApp: true));



      // if (Get.find<AuthController>().isLoggedIn()) {
      //   await Get.find<WishListController>().getWishList(true, false);
      //
      //   Get.offNamed(RouteHelper.getLandingRoute());
      //
      //
      // } else {
      //   if (Get.find<SplashController>().showIntro()!) {
      //     /*Get.find<LocalizationController>().setLanguage(Locale(
      //             AppConstants.languages[0].languageCode,
      //             AppConstants.languages[0].countryCode,
      //           ));*/
      //     Get.offNamed(RouteHelper.getOnBoardingRoute());
      //     // Get.offNamed(RouteHelper.getLanguageRoute('splash'));
      //   } else {
      //     Get.offNamed(RouteHelper.getSignInRoute(RouteHelper.splash));
      //   }
      //
      //
      // }});


  }
    );
}
}


