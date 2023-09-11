import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_task/commen/build_context.dart';
import 'package:new_task/core/config/theme/colors_app.dart';
import '../../core/config/routing/router.dart';
import '../../generated/app_String.dart';
import '../../generated/app_assets.dart';
import '../../token/cash_helper.dart';
import '../app/app_svg_picture.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if ( CachHelper.sharedPreferences.getString('token')!= null) {
      goHome();
    }
    else{
      goLogin();
    }
    super.initState();
  }


  Future<void> goLogin() async {
    await Future.delayed(
      const Duration(seconds: 5),
          () => context.pushReplacementNamed(GRouter.config.authRoutes.login),
    );
  }

  Future<void> goHome() async {
    await Future.delayed(
      const Duration(seconds: 3),
          () =>   context.goNamed(GRouter.config.productRoutes.productScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: Padding(
        padding: REdgeInsetsDirectional.only(bottom: 24),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              RSizedBox(
                  child: Image.asset(
                    Assets.splashImage,
                    alignment: Alignment.center,
                    height: 150,width: 150,color: context.colorScheme.onPrimary,)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppString.HelloInMyProject,
                  ),
                  5.horizontalSpace,
                  const AppSvgPicture(Assets.heartIcon),
                ],
              ),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

