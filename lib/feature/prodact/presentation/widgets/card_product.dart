import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_task/commen/build_context.dart';
import 'package:new_task/feature/app/widgets/contaier_primary.dart';
import 'package:new_task/feature/prodact/presentation/models/all_product.dart';
import '../../../../core/config/routing/router.dart';

class CardProduct extends StatelessWidget {
  AllProduct product;
   CardProduct({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding (
      padding: REdgeInsetsDirectional.only(start: 20,end: 20,top:20 ),
      child: InkWell(
        onTap: () {
          context.go(
              "${GRouter.config.productRoutes.productScreen}/${GRouter.config.productRoutes.detailProductScreen}",
              extra:product
          );
        },
        child: Container(
            width: 200.w,
            height: 220.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                border:  Border.all(
                    color: context.colorScheme.primary,
                     width: 2,
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RSizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Image.network(product.image!,height: 100.h,width: 100.w,fit: BoxFit.contain)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   // ContainerPrimary(text: "Price ${product.price!} s.y"),
                   ContainerPrimary(text: "${product.category!}"),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
