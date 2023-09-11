import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_task/commen/build_context.dart';
import 'package:new_task/feature/prodact/presentation/models/all_product.dart';
import 'package:new_task/feature/prodact/presentation/widgets/product_img.dart';
import 'chateTOcart.dart';


class BodyScreen extends StatelessWidget {
  final AllProduct product;

  const BodyScreen({Key ?key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: context.colorScheme.onPrimary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: '${product.id}',
                    child: ProductPoster(
                      size: size,
                      image: product.image!,
                    ),
                  ),
                  // ListOfColors(),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        vertical: 10.h),
                    child: Text(
                      product.category!,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Container(
                    padding: REdgeInsetsDirectional.only(start: 7,end: 7,top: 10,bottom: 10),

                    decoration: BoxDecoration(
                        color: context.colorScheme.primary.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Price ${product.price} s.y",textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      product.title!,
                      style: Theme.of(context).textTheme.bodyLarge,

                    ),
                  ),
                  Padding(
                    padding: REdgeInsetsDirectional.only(bottom: 20),
                    child: Text(
                      product.description!,
                      style: Theme.of(context).textTheme.bodyMedium,

                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
             ChatAndAddToCart.chatAndAddToCart(product: product),
          ],
        ),
      ),
    );
  }
}