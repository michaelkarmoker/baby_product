
import 'dart:async';
import 'dart:io';


import 'package:baby_product/view/base/custom_button.dart';
import 'package:baby_product/view/base/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';






class SignUp extends StatefulWidget {
  final bool exitFromApp;

  const SignUp({Key? key, required this.exitFromApp}) : super(key: key);
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<SignUp> {


  bool isHidden=false;
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _canExit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) =>  Get.find<AuthController>().setuserName());

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
                  backgroundColor: Colors.green,
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
                return Container(

                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.white24
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Container(
                                    padding: EdgeInsets.all(10),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [

                                        CustomTextField(

                                          hintText: "Name",
                                          controller: authController.emailController,
                                          focusNode: _emailFocus,
                                          nextFocus: _passwordFocus,
                                          inputType: TextInputType.emailAddress,
                                          capitalization: TextCapitalization.words,
                                          divider: true, onSubmit: (){}, prefixIcon:'assets/icon/user.png',

                                        ),
                                        CustomTextField(

                                          hintText: "Password",
                                          controller: authController.passwordController,
                                          focusNode: _passwordFocus,
                                          inputAction: TextInputAction.done,
                                          inputType: TextInputType.visiblePassword,
                                          capitalization: TextCapitalization.words,
                                          divider: true,
                                          isPassword: true, prefixIcon: "assets/icon/lock.png", onSubmit: (){}, nextFocus: null,

                                        ),
                                        SizedBox(height: 10,),
                                        Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Checkbox(

                                                value: authController.isActiveRememberMe,

                                                onChanged: (bool? isChecked) => authController.isActiveRememberMe=isChecked!,
                                              ),

                                              Text('Remember me',style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge),),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        !authController.isLoading ?CustomButton(
                                          width: Get.width*0.50,
                                          buttonText: 'Log in',
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
                          SizedBox(height: 20,),

                        ],
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
