import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProfile extends StatelessWidget {
  const ShimmerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child:Padding(
        padding: REdgeInsetsDirectional.only(start: 20.w,end: 20.w,top: 70.h),
        child:  Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: RSizedBox(
                height: 100,
                width: 100,
              ),
            ),
            80.verticalSpace,
            Container(
              height: 70,
              width: double.infinity,
              color: Colors.red,
            ),
            30.verticalSpace,
            Container(
              height: 70,
              width: double.infinity,
              color: Colors.red,
            ),
            30.verticalSpace,
            Container(
              height: 70,
              width: double.infinity,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
