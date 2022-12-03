



import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class ProgressHUD extends StatelessWidget {

  final Widget child;
  final String titileText;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color>? valueColor;

  ProgressHUD({
    required this.child,
    required this.inAsyncCall,
    this.opacity = 0.5,
    this.color = Colors.black,
    this.valueColor, this.titileText="Please Wait.....",
  }) ;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          new Center(
            child: Padding(
              padding: const EdgeInsets.only(left:30.0,right:30),
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/3,
                decoration: BoxDecoration(
                  color:Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: SpinKitFadingCircle(
                          color: Colors.white
                          /*itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color:Colors.green,
                              ),
                            );
                          }*/,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(titileText,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.white),))
                  ],
                ),
              ),
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}