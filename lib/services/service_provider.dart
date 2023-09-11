import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_task/feature/auth/presentation/cubit/auth_cubit.dart';
import '../feature/app/app_manager_cubit.dart';
import '../feature/prodact/presentation/cubit/product_cubit.dart';



class ServiceProvider extends StatelessWidget {
  const ServiceProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppManagerCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ProductCubit()..createDataBase()),
      ],
      child: child,
    );
  }

  final Widget child;
}
