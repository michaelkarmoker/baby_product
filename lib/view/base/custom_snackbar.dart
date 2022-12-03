

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/dimensions.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  Get.showSnackbar(GetBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    maxWidth: Dimensions.WEB_MAX_WIDTH,
    duration: Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
    borderRadius: Dimensions.RADIUS_DEFAULT,
    isDismissible: true,
   // dismissDirection: SnackBar.HORIZONTAL,
  ));
}