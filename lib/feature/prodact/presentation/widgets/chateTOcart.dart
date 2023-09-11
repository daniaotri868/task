import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_task/commen/build_context.dart';
import 'package:new_task/feature/prodact/presentation/cubit/product_cubit.dart';
import 'package:new_task/feature/prodact/presentation/models/all_product.dart';


class ChatAndAddToCart extends StatefulWidget {
  final AllProduct product;
   const ChatAndAddToCart.chatAndAddToCart({super.key, required this.product});

  @override
  State<ChatAndAddToCart> createState() => _ChatAndAddToCartState();
}

class _ChatAndAddToCartState extends State<ChatAndAddToCart> {
  int x=0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
  builder: (context, state) {
    return Container(
      margin:REdgeInsetsDirectional.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12 / 2,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colorScheme.primary, // اللون الذي تريده لحواف
                width: 1.0, // عرض الحافة
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                 if(x==0)
                   {
                     x=0;
                   }
                 else
                   {
                     x--;
                   }
                });
              },
              child: CircleAvatar(
                backgroundColor: context.colorScheme.onPrimary,
                radius: 10,
                child: const Icon(Icons.remove,size: 12,color: Colors.black,weight: 10),
              ),
            ),
          ),
          5.horizontalSpace,
          Text("$x"),
          5.horizontalSpace,
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colorScheme.primary, // اللون الذي تريده لحواف
                width: 1.0, // عرض الحافة
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  x++;
                });
              },
              child: CircleAvatar(
                backgroundColor: context.colorScheme.onPrimary,
                radius: 10,
                child: const Icon(Icons.add,size: 12,color: Colors.black,weight: 10),
              ),
            ),
          ),
          5.horizontalSpace,
          TextButton(
            onPressed: () {
              showDialog(context: context, builder: (context) =>CupertinoAlertDialog(
                title: const Text("Do you really want to add it to the cart??!"),
                // content: Text("Do you Delete all notebook ?!"),
                actions: [
                  CupertinoDialogAction(child: TextButton(child: Text("Yes",style: TextStyle(color: context.colorScheme.primary)),onPressed: () {
                    // context.read<ProductCubit>().postCartDio(userId: 1, date: "${DateTime.now()}", productId: widget.product.id!, quantity: x, context: context);
                   if(x!=0)
                     {
                       context.read<ProductCubit>().insertDataBase(index: widget.product.id!-1, date: "${DateTime.now()}", count: x);
                     }
                   else
                     {
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Choose the number of pieces")));
                     }
                    print( widget.product.id!-1);
                    print(x!);

                    Navigator.pop(context);

                  },)),
                  CupertinoDialogAction(child: TextButton(child: Text("No",style: TextStyle(color: context.colorScheme.primary)),onPressed: () {

                    Navigator.pop(context);
                  },)),

                ],
              ),);
            },
            child: Text(
              "Add to Cart",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.primary
              ),
            ),
          ),



        ],
      ),
    );
  },
);
  }
}