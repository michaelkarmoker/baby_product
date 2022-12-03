import 'dart:convert';
import 'dart:io';


import 'package:baby_product/data/model/body/login_body.dart';
import 'package:baby_product/view/base/custom_snackbar.dart';
import 'package:baby_product/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';




import '../data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;


  AuthController({
    required this.authRepo,
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController studentId = TextEditingController();
  TextEditingController mobile = TextEditingController();


  bool _isLoading = false;
  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;

  set isActiveRememberMe(bool value) {
    _isActiveRememberMe = value;
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  Future<void> setuserName() async {
    String userName = getUserName();
    String password = getUserPassword();
    emailController.text = userName;
    passwordController.text = password;
    mobile.text=getStudentMobile();
    studentId.text=getStudentId();
  }

  Future<void> login(LoginBody loginBody) async {
    _isLoading = true;
    update();

    Response response = await authRepo.login(loginBody: loginBody);


    if (response.statusCode == 200) {
       /*loginResponse =LoginResponse.fromJson(response.body);
       *//*await authRepo.saveUserId(loginResponse!.)*//*
       if(_isActiveRememberMe){
         loginResponse!.isStudent!?await authRepo.saveStudentIdAndMobile(loginBody.studentId!, loginBody.mobile_no!):
         await authRepo.saveUserNameAndPassword(loginBody.user_name!, loginBody.password!);

       }else{
         await authRepo.clearUserNumberAndPassword();
       }
       await authRepo.saveUserType(loginResponse!.isStudent!?"0":"1");
         loginResponse!.isStudent!?await authRepo.saveUserProfile(
             loginResponse!.isStudent!,
             loginResponse!.student!.name!,

             loginResponse!.student!.studentId!, loginResponse!.student!.mobile, loginResponse!.student!.image):
         await authRepo.saveUserProfile(
             loginResponse!.isStudent!,
             loginResponse!.user!.name!, loginResponse!.user!.email.toString(),
             " ", loginResponse!.user!.image);
        await authRepo.saveUserToken(loginResponse!.token!.original!.accessToken!);
        loginResponse!.isStudent!?await authRepo.saveUserId(loginResponse!.student!.id.toString()):
        await authRepo.saveUserId(loginResponse!.user!.id.toString());*/

        showCustomSnackBar("Login Successfully",isError: false);
        Get.offAll(Home());

    } else {

      showCustomSnackBar(response.body["message"]);

    }

    _isLoading = false;
    update();
  }



  void loginVerification() async {
    String _email = emailController.text.trim();
    String _password = passwordController.text.trim();

      if (_email.isEmpty) {
        showCustomSnackBar('Enter username');
      } else if (_password.isEmpty) {
        showCustomSnackBar('Enter password');
      } else if (_password.length < 5) {
        showCustomSnackBar('The Password must be at least 5 Characters');
      } else {
        login(LoginBody(user_name: _email, password: _password));
      }

  }






  bool isLoggedIn() {

    return authRepo.isLoggedIn();
  }

  bool? getIsStudent() {

    return authRepo.getIsStudent();
  }
  String getUserPermission() {
    return authRepo.getUserName() ?? "";
  }
  String getUserId() {
    return authRepo.getUserId() ?? "";
  }
  void saveUserNameAndPassword(
    String UserName,
    String password,
  ) {
    authRepo.saveUserNameAndPassword(UserName, password);
  }

  String getUserName() {
    return authRepo.getUserName() ?? "";
  }
  String getStudentId() {
    return authRepo.getStudentId() ?? "";
  }
  String getStudentMobile() {
    return authRepo.getStudetMobile() ?? "";
  }
  String getUserPassword() {
    return authRepo.getUserPassword() ?? "";
  }
//profile====

  String getUserFullName() {
    return authRepo.getUserFullName() ?? "";
  }
  String getUserEmail() {
    return authRepo.getUserEmail() ?? "";
  }
  String getUserMobile() {
    return authRepo.getUserMobile() ?? "";
  }
  String getUserImage() {
    return authRepo.getUserImage() ?? "";
  }

  Future<bool> clearUserNumberAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }
  Future<bool> signOut() async {
    return authRepo.clearUserSigningInfo();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }
/*  void saveUserProfile(
      String name,
      String email,
      String phone,
      String image,
      ) {
    authRepo.saveUserProfile(name,email,phone,image);
  }*/
  void saveUserType(
      String userType,
      ) {
    authRepo.saveUserType(userType);
  }

  String getUserType() {
    return authRepo.getUserType();
  }
}
