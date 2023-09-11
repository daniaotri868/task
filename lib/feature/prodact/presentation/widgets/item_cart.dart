import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_task/commen/build_context.dart';
import 'package:intl/intl.dart';
import 'package:new_task/core/config/theme/colors_app.dart';
import 'package:new_task/feature/prodact/presentation/pages/details_product.dart';
import '../../../../core/config/routing/router.dart';
import '../../../app/widgets/contaier_primary.dart';
import '../cubit/product_cubit.dart';
import '../models/all_product.dart';

class ItemCart extends StatelessWidget {
  final AllProduct cartItem;
  final int index;
  const ItemCart({Key? key,required this.cartItem, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return BlocBuilder<ProductCubit, ProductState>(
  builder: (context, state) {
     return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20),
            color: Colors.red.shade200
        ),
        child:  Icon(Icons.delete,color: context.colorScheme.onPrimary),
      ),
      onDismissed: (direction) {
        context.read<ProductCubit>().deleteDataBase(id:context.read<ProductCubit>().listDataBase[index]['idx'] );
      },
      key: UniqueKey(),
      child: Container(
        padding: REdgeInsetsDirectional.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20),
            border:  Border.all(
                color: context.colorScheme.primary
            )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:
                    Image.network(cartItem.image!,width: 120.w,height:120.h,fit: BoxFit.contain,)
                ),
              ],
            ),
            Padding(
              padding: REdgeInsetsDirectional.only(start: 20),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      RSizedBox(height: 5.h,),
                      Text(" ${cartItem.category} ",style: TextStyle(fontWeight: FontWeight.bold, overflow:TextOverflow.ellipsis ,fontSize: 17.sp)),
                      RSizedBox(height: 7.h,),
                      ContainerPrimary(text: "Price ${cartItem.price!} s.y"),
                      RSizedBox(height: 7.h,),
                      Text("Date: ${(formatter.format(DateTime.tryParse(context.read<ProductCubit>().listDataBase[index]['dt'])! ))}"
                          ,style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey
                          )
                      ),
                      const RSizedBox(height: 5,),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(product: cartItem),));
                            // context.go(
                            //     "${GRouter.config.productRoutes.productScreen}/${GRouter.config.productRoutes.detailProductScreen}",
                            //     extra:cartItem
                            // );
                          },
                          child: Text("More Details ...",style: TextStyle(color: context.colorScheme.primary,fontSize: 15.sp),


                          )
                      ),
                    ],
                  ),
                  CircleAvatar(
                      radius: 15,
                      child: Center(
                        child: Text("${context.read<ProductCubit>().listDataBase[index]['count']}"
                          ,style:context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onPrimary
                          ) ,
                        ),
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
