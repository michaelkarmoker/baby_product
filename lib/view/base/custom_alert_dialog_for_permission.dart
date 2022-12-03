import 'package:baby_product/util/dimensions.dart';
import 'package:baby_product/util/images.dart';
import 'package:baby_product/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomAlerDialogForPermission extends StatelessWidget {
  final String title;
  final String description;
  final String yesBtnText;
  final String noBtnText;
  final bool isError;
  final Function() yesBtntap;
  const CustomAlerDialogForPermission({Key? key, required this.title, required this.yesBtntap, required this.yesBtnText, required this.noBtnText, this.description=" ",  this.isError=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE)),
      insetPadding: EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20,),
            Image.asset(isError?Images.error:Images.confirmicon,height: 40,width: 40,) ,

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text('${title}',textAlign:TextAlign.center,style: robotoRegular.copyWith(color:isError?Colors.redAccent:Colors.green,fontSize: Dimensions.fontSizeLarge))),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text('${description}',textAlign:TextAlign.center,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge))),

                ],
              ),
            ),
            SizedBox(height: 10,),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide( //                   <--- right side
                        color: Colors.black12,
                        width: 1.5,
                      ),
                    ),
                  ),
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: yesBtntap,
                      child: Container(
                        padding: EdgeInsets.all(5),
                          width: Get.width,
                          child: Text("${yesBtnText}",textAlign:TextAlign.center,
                            style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                color: Theme.of(context).primaryColor,fontWeight: FontWeight.w500),)),),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(

                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                     border: Border(
                        left: BorderSide( //                   <--- right side
                          color: Colors.black12,
                          width: 1.5,
                        ),
                       top: BorderSide( //                   <--- right side
                         color: Colors.black12,
                         width: 1.5,
                       ),
                    ),
                    ),
                    child: InkWell(
                      onTap:(){
                        Get.back();
                      },
                      child: Container(
                          padding: EdgeInsets.all(5),
                          width: Get.width,
                          child: Text("${noBtnText}",textAlign:TextAlign.center,
                            style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                color: Colors.red,fontWeight: FontWeight.w500),)),),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
