/*
import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String onBoarding = '/on-boarding';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String landing = '/landing';
  static const String details = '/details';
  static const String categories = '/categories';
  static const String productList = '/productList';





  static String getInitialRoute() => '$initial';

  static String getSplashRoute() => '$splash';
  static String getOnBoardingRoute() => '$onBoarding';
  static String getSignInRoute(String page) => '$signIn?page=$page';
  static String getSignUpRoute() => '$signUp';
  static String getLandingRoute() => '$landing';
  static String getDetailsRoute() => '$details';
  static String getCategoryRoute() => '$categories';
  static String getProductListRoute(String id,String listType){
  return '$productList?id=$id&listType=$listType';
    }




  static List<GetPage> routes = [
  //  GetPage(name: initial, page: () => LandingPage()),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: signIn, page: () => SignIn(
      exitFromApp: Get.parameters['page'] == signUp || Get.parameters['page'] == splash,
    )),
    GetPage(name: signUp, page: () => SignUp()),
    GetPage(name: landing, page: () => LandingPage()),
    GetPage(name: details, page: () => ProductDetailsScreen()),
    GetPage(name: categories, page: () => AllCategoryScreen()),
    GetPage(name: productList, page: () => ProductListScreen(listType: Get.parameters['listType']! ,id: Get.parameters['id']!,)),


    //GetPage(name: onBoarding, page: () => OnBoardingScreen()),


  ];

 */
/* static getRoute(Widget navigateTo) {
    return false? UpdateScreen(isUpdate: true)
        : false? UpdateScreen(isUpdate: false)
        : Get.find<LocationController>().getUserAddress() != null ? navigateTo
        : AccessLocationScreen(fromSignUp: false, fromHome: false, route: Get.currentRoute);
  }*//*

}
*/
