import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductPoster extends StatelessWidget {
  const ProductPoster({
     Key ?key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      // the height of this container is 80% of our width
      height: size.width * 0.8,

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            // height: size.width * 0.7,
            // width: size.width * 0.7,
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   shape: BoxShape.circle,
            // ),
          ),
          Image.network(
            image,
            height: 200.h,
            width: 200.w,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}