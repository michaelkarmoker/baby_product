

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageCached extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit ?fit;
  final String placeholder;
  CustomImageCached({required this.image, this.height, this.width, this.fit, this.placeholder='assets/image/placeholder.png'});

  @override
  Widget build(BuildContext context) {
    print(image);
    return CachedNetworkImage(

        imageUrl:image,
        placeholder: (context, url) =>Container(
          
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            image: DecorationImage(

              image: new AssetImage(placeholder),
              fit: fit,

            ),
          ),
        ),


        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            image: DecorationImage(

                image: imageProvider,
                fit: fit,

               ),
          ),
        ),
      errorWidget: (c, o, s) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          image: DecorationImage(

            image: new AssetImage(placeholder),
            fit: fit,

          ),
        ),
      ),
    );
  }
}