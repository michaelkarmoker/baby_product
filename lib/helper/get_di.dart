import 'dart:convert';



import 'package:baby_product/controller/auth_controller.dart';
import 'package:baby_product/data/api/api_client.dart';
import 'package:baby_product/util/app_constants.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';


import 'package:shared_preferences/shared_preferences.dart';



import '../data/repository/auth_repo.dart';




Future<void> init() async {


  final sharedPreferences = await SharedPreferences.getInstance();
   Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  //repo

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));











  //controller

  Get.lazyPut(() => AuthController(authRepo: Get.find()));








}
