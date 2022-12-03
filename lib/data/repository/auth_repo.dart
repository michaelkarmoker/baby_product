import 'dart:async';




import 'package:flutter/foundation.dart';
import 'package:get/get.dart';



import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';
import '../model/body/login_body.dart';
import '../model/body/signup_body.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

 /* Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.REGISTER_URI, signUpBody.toJson());
  }*/

  Future<Response> login({required LoginBody loginBody}) async {
   // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    return await apiClient.postData(AppConstants.LOGIN_URI, loginBody.toJson());
  }






  // for  user token
  Future<bool> saveUserToken(String token) async {
     apiClient.token = token;

     apiClient.updateHeader(token);

    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<bool> saveUserId(String id) async {


    return await sharedPreferences.setString(AppConstants.USERID, id);
  }


  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }
  String getUserId() {
    return sharedPreferences.getString(AppConstants.USERID) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }



  // for  Remember Email
  Future<void> saveUserNameAndPassword(String name, String password,) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(AppConstants.USER_NAME, name);

    } catch (e) {
      throw e;
    }
  }
  Future<void> saveStudentIdAndMobile(String id, String mobile,) async {
    try {
      await sharedPreferences.setString(AppConstants.STUDENT_ID, id);
      await sharedPreferences.setString(AppConstants.STUDENT_MOBILE, mobile);

    } catch (e) {
      throw e;
    }
  }
  Future<void> saveUserType(  String type,) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_TYPE, type);


    } catch (e) {
      throw e;
    }
  }
  String getUserType() {
    return sharedPreferences.getString(AppConstants.USER_TYPE) ?? "";
  }
  Future<void> saveUserProfile(
      bool isStudent,
      String name,
      String email,
      String? phone,
      String? image,) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_EMAIL, email);
      await sharedPreferences.setBool(AppConstants.IS_STUDENT, isStudent);
      await sharedPreferences.setString(AppConstants.USER_PHONE, phone??" ");
      await sharedPreferences.setString(AppConstants.USER_IMAGE, image??" ");
      await sharedPreferences.setString(AppConstants.USER_NAMEP, name);

    } catch (e) {
      throw e;
    }
  }
  bool? getIsStudent() {
    return sharedPreferences.getBool(AppConstants.IS_STUDENT);
  }
  String getUserName() {
    return sharedPreferences.getString(AppConstants.USER_NAME) ?? "";
  }
  String getStudentId() {
    return sharedPreferences.getString(AppConstants.STUDENT_ID) ?? "";
  }
  String getStudetMobile() {
    return sharedPreferences.getString(AppConstants.STUDENT_MOBILE) ?? "";
  }
  String getUserPermission() {
    return sharedPreferences.getString(AppConstants.USER_NAME) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

//profile===
  String getUserFullName() {
    return sharedPreferences.getString(AppConstants.USER_NAMEP) ?? "";
  }
  String getUserEmail() {
    return sharedPreferences.getString(AppConstants.USER_EMAIL) ?? "";
  }
  String getUserMobile() {
    return sharedPreferences.getString(AppConstants.USER_PHONE) ?? "";
  }
  String getUserImage() {
    return sharedPreferences.getString(AppConstants.USER_IMAGE) ?? "";
  }

  Future<bool> clearUserSigningInfo() async {


    //await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    await sharedPreferences.remove(AppConstants.USERID);
    //await sharedPreferences.remove(AppConstants.USER_NAME);
    return await sharedPreferences.remove(AppConstants.TOKEN);

  }

  Future<bool> clearUserNumberAndPassword() async {


    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    return await sharedPreferences.remove(AppConstants.USER_NAME);
  }
}
