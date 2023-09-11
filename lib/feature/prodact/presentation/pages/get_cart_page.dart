import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_task/commen/build_context.dart';
import 'package:new_task/feature/prodact/presentation/cubit/product_cubit.dart';
import 'package:new_task/feature/prodact/presentation/models/all_product.dart';
import 'package:new_task/feature/prodact/presentation/widgets/item_cart.dart';
import '../../../app/widgets/contaier_primary.dart';



class GetCartScreen extends StatefulWidget {
  final List<AllProduct> getProduct ;
  const GetCartScreen({Key? key,required this.getProduct}) : super(key: key);

  @override
  State<GetCartScreen> createState() => _GetCartScreenState();
}

class _GetCartScreenState extends State<GetCartScreen> {
  @override

  void initState() {
    super.initState();
    context.read<ProductCubit>().getDataBase(context.read<ProductCubit>().database);
  }
  double totalPrice =0;
  double mainTotalPrice =0;
  Widget build(BuildContext context) {

    return BlocBuilder<ProductCubit, ProductState>(
  builder: (context, state) {
    return Scaffold(
      body:context.read<ProductCubit>().listDataBase.isEmpty?  const Center(
        child: Text("Your Cart Is Empty"),
      ):Padding(
        padding: REdgeInsetsDirectional.only(start: 20,end: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.verticalSpace,
            CircleAvatar(
              child: IconButton(onPressed: () {
                showDialog(context: context, builder: (context) =>CupertinoAlertDialog(
                  title:  const Text("Are you sure you want to delete ?!"),
                  actions: [
                    CupertinoDialogAction(child: TextButton(child: Text("Yes",style: TextStyle(color: context.colorScheme.primary)),onPressed: () async{
                      context.read<ProductCubit>().deleteAll();

                      Navigator.pop(context);

                    },)),
                    CupertinoDialogAction(child: TextButton(child: Text("No",style: TextStyle(color: context.colorScheme.primary)),onPressed: () {
                      Navigator.pop(context);
                    },)),
                  ],
                ),);
              }, icon: Icon(Icons.delete,color: context.colorScheme.onPrimary,size: 20,)),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    AllProduct cartItem=widget.getProduct[context.read<ProductCubit>().listDataBase[index]['idx']];
                    return ItemCart(cartItem: cartItem,index: index,);

                  } ,
                  separatorBuilder: (context, index) => const RSizedBox(height: 10) ,
                  itemCount: context.read<ProductCubit>().listDataBase.length),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
