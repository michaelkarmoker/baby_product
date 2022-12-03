


import 'package:flutter/material.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final Color? color;
  final IconData? icon;

  CustomButton({required this.onPressed,this.color, required this.buttonText,  this.margin, this.width, this.height,
    this.fontSize, this.radius=5, this.icon, });

  @override
  Widget build(BuildContext context) {


    return Center(child: SizedBox(width: width != null ? width : Dimensions.WEB_MAX_WIDTH,height: height!=null?height:Dimensions.BUTTON_HEIGHT, child:Container(

      decoration:  BoxDecoration(
          color:Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(radius))
      ),
        child:Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onPressed,
              child: Center(
                child: Text(buttonText,style: TextStyle(color:color??Colors.white,fontWeight: FontWeight.w600,fontSize: fontSize??Dimensions.fontSizeExtraLarge),)),
              )),
        )
    ));
  }
}
