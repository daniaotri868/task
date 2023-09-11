import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_task/commen/build_context.dart';

class ContainerPrimary extends StatelessWidget {
  final String text;
  final  color;
  const ContainerPrimary({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: REdgeInsetsDirectional.only(start: 7,end: 7,top: 10,bottom: 10),
      decoration: BoxDecoration(
          color:color ?? context.colorScheme.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Text(text,textAlign: TextAlign.center),
    );
  }
}
