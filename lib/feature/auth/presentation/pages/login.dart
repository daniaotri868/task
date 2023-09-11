import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../generated/app_assets.dart';
import '../../../app/app_svg_picture.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/container_login.dart';


class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return BlocListener<AuthCubit, AuthState>(

      listener: (context, state) {
        if (state is AppSuccessfulPostLogin) {
          context.goNamed(GRouter.config.productRoutes.productScreen);
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {

       return Scaffold(
        backgroundColor: Colors.white,
        body:Column(
          children: [
            const RSizedBox(height: 20,),
            const AppSvgPicture(Assets.backgroundLogin),
            ContainerLogin(),
          ],
        ),
      );
  },
),
    );
  }
}


