import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_task/commen/build_context.dart';
import 'package:new_task/feature/prodact/presentation/cubit/product_cubit.dart';
import 'package:new_task/feature/prodact/presentation/models/all_product.dart';
import 'package:new_task/feature/prodact/presentation/widgets/card_product.dart';
import 'package:new_task/generated/app_assets.dart';
import '../../../../core/config/routing/router.dart';
import '../../../app/widgets/loading_indicator.dart';
import '../widgets/text_field_search.dart';


class ShowAllProduct extends StatefulWidget {
  const ShowAllProduct({Key? key}) : super(key: key);

  @override
  State<ShowAllProduct> createState() => _ShowAllProductState();

}

class _ShowAllProductState extends State<ShowAllProduct> {
  List<AllProduct> _searchResult = [];

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().showAllProductDio();
    _searchResult=[];
  }


  List<AllProduct> listProduct=[];
  TextEditingController controllerPassword=TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if(state is AppSuccessfulGetProduct)
          {
            listProduct=state.result;
          }
        return SafeArea(
          bottom: false,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              bottom:  PreferredSize(
                preferredSize: Size.fromHeight(48.0),
                child: Padding(
                  padding: REdgeInsetsDirectional.only(
                      top: 5,
                      start: 20,
                      end: 20,
                      bottom: 10
                  ),
                  child: TextFieldSearch(
                    onChange: (value) {
                      print(value);
                     setState(() {
                       _searchResult.clear();
                     });
                      if (value.isNotEmpty) {
                        listProduct?.forEach((item) {
                          if (item.price.toString()!.contains(value)|| item.category.toString()!.contains(value)) {
                            setState(() {
                              _searchResult.add(item);
                            });
                          }
                          else
                          {
                            print("No Content");
                          }
                        });
                      } else {
                        setState(() {_searchResult.addAll(listProduct as Iterable<AllProduct>);});
                      }
                      print(_searchResult);
                    },
                  ),
                ),
              ),
              toolbarHeight:100.h,
              backgroundColor: context.colorScheme.primary.withOpacity(0.5),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r)
                  ),
                  borderSide: const BorderSide(color: Colors.transparent)
              ),
              leading: Padding(
                padding: REdgeInsetsDirectional.all(7),
                child: InkWell(
                    onTap: () {
                      context.go(
                          "${GRouter.config.productRoutes.productScreen}/${GRouter.config.profileRoutes.profileScreen}"
                      );
                    },
                    child:Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.colorScheme.primary, // اللون الذي تريده لحواف
                          width: 1.0, // عرض الحافة
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(Assets.lock,),
                        backgroundColor: context.colorScheme.onPrimary,
                        radius: 10,

                      ),
                    )



                ),
              ),
              actions: [
                IconButton(onPressed: () async {
                  // print(_searchResult);
                  // print(context.read<ProductCubit>().listDataBase[1]['idx']);
                  context.go(
                      "${GRouter.config.productRoutes.productScreen}/${GRouter.config.productRoutes.getCartScreen}",
                      extra: _searchResult.isEmpty?listProduct!: _searchResult
                  );
                }, icon: const Icon(Icons.shopping_cart_rounded,))
              ],



            ),
            body: ConditionalBuilder(
              condition: listProduct!.isNotEmpty  ,
              builder:(context) =>  GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) =>
                      CardProduct(product:_searchResult.isEmpty?listProduct![index]: _searchResult[index]),
                  itemCount:_searchResult.isEmpty?listProduct?.length : _searchResult.length
              ),
              fallback: (context) => const Center(child: LoadingIndicator()),
            ),



          ),
        );
        //   ConditionalBuilder(
        //   condition:  state is AppSuccessfulGetProduct ,
        //   builder: (context) {
        //     if( state is AppSuccessfulGetProduct)
        //       {
        //          listProduct=state.result;
        //          _searchResult=listProduct!;
        //       }
        //     else
        //       {
        //         listProduct=[];
        //       }
        //     // List<AllProduct> listProduct = state is AppSuccessfulGetHouses
        //     //     ? state.result
        //     //     : [];
        //     return
        //   },
        //   fallback: (context) => const Scaffold(body: Center(child: LoadingIndicator())),
        //
        // );
      },
    );
  }
}














