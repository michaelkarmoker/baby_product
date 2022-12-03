import 'package:baby_product/util/dimensions.dart';
import 'package:baby_product/util/images.dart';
import 'package:baby_product/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NoResultFound extends StatelessWidget {
  final String title;
  final String description;
  const NoResultFound({Key? key,  this.title="No Result Found",  this.description=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width,
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(Images.result_not_found,height: 100,),
            SizedBox(height: 20,),
            Text("${title}",style: robotoMedium.copyWith(color: Colors.black,fontSize: Dimensions.fontSizeExtraLarge),),
            Text("${description}",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),

          ],
        ),
      ),
    );
  }
}
