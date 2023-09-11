import 'package:flutter/material.dart';
import 'package:new_task/commen/build_context.dart';
import 'package:new_task/feature/prodact/presentation/models/all_product.dart';
import '../widgets/BodyWidget.dart';


class DetailsScreen extends StatelessWidget {
  final AllProduct product;


  const DetailsScreen({Key ?key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary.withOpacity(0.3),
      appBar: buildAppBar(context),
      body: BodyScreen(
        product: product,

      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.colorScheme.onPrimary,
      elevation: 0,
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),

    );
  }
}