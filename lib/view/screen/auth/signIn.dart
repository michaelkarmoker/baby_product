
import 'dart:async';
import 'dart:io';


import 'package:baby_product/util/images.dart';
import 'package:baby_product/view/base/custom_button.dart';
import 'package:baby_product/view/base/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';
import '../../../util/styles.dart';

import '../../base/custom_snackbar.dart';





class SignIn extends StatefulWidget {
  final bool exitFromApp;

  const SignIn({Key? key, required this.exitFromApp}) : super(key: key);
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<SignIn> {


  bool isHidden=false;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _studentFocus = FocusNode();
  final FocusNode _mobileFocus = FocusNode();
  bool _canExit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
          Get.find<AuthController>().setuserName();

          Get.find<AuthController>().getUserName().isNotEmpty?Get.find<AuthController>().isActiveRememberMe=true:Get.find<AuthController>().isActiveRememberMe=false;
          Get.find<AuthController>().update();
        });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(


        body: WillPopScope(

          onWillPop: ()async {
            if(widget.exitFromApp) {
              if (_canExit) {
                if (GetPlatform.isAndroid) {
                  SystemNavigator.pop();
                } else if (GetPlatform.isIOS) {
                  exit(0);
                } else {
                 // Navigator.pushNamed(context, RouteHelper.getInitialRoute());
                }
                return Future.value(false);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Back press again to exit'.tr, style: TextStyle(color: Colors.white)),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Color(0xff29CA8E),
                  duration: Duration(seconds: 2),
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                ));
                _canExit = true;
                Timer(Duration(seconds: 2), () {
                  _canExit = false;
                });
                return Future.value(false);
              }
            }else {
              return true;
            }
          },
          child: SafeArea(
            child: GetBuilder<AuthController>(

              builder: (authController) {
                return SingleChildScrollView(
                  child: Container(
                      height: Get.height,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0,right: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Card(
                              elevation: 4,
                              child: Container(

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white24
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height:10),
                                      Image.asset(Images.logo,height: Get.height/8,),

                                      Container(
                                        padding: EdgeInsets.all(10),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [

                                            Column(
                                              children: [
                                                CustomTextField(

                                                  hintText: "Email",
                                                  controller: authController.emailController,
                                                  focusNode: _emailFocus,
                                                  nextFocus: _passwordFocus,
                                                  inputType: TextInputType.emailAddress,
                                                  capitalization: TextCapitalization.words,
                                                  divider: false, onSubmit: (){}, prefixIcon:'assets/icon/user.png',

                                                ),
                                                CustomTextField(

                                                  hintText: "Password",
                                                  controller: authController.passwordController,
                                                  focusNode: _passwordFocus,
                                                  inputAction: TextInputAction.done,
                                                  inputType: TextInputType.visiblePassword,
                                                  capitalization: TextCapitalization.words,
                                                  divider: false,
                                                  isPassword: true, prefixIcon: "assets/icon/lock.png", onSubmit: (){}, nextFocus: null,

                                                ),
                                              ],
                                            ),


                                            SizedBox(height: 10,),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Checkbox(

                                                  value: authController.isActiveRememberMe,

                                                  onChanged: (bool? isChecked) => authController.isActiveRememberMe=isChecked!,
                                                ),

                                                Text('Remember me',style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge),),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            !authController.isLoading ?CustomButton(

                                              width: Get.width,

                                              buttonText: 'Login',
                                              onPressed: ()=>{
                                                authController.loginVerification(),
                                                //Get.to(SalesOfficerHomeScreen())
                                              },
                                              //  onPressed: authController.acceptTerms ? () => _register(authController, _countryDialCode) : null,
                                            ):Center(child: CircularProgressIndicator()),










                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            )
          ),
        )

    );
  }

  void _toggle() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
