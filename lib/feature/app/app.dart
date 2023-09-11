import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/routing/router.dart';
import '../../commen/constants/constants.dart';
import '../../core/config/theme/app_theme.dart';
import '../../services/service_provider.dart';
import 'app_manager_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: designSize,
      builder: (context, child) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: ServiceProvider(
          child: BlocBuilder<AppManagerCubit, AppManagerState>(
            builder: (context, state) {
              return MaterialApp. router(
                title: "Fly Food App",
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light(context),
                routerConfig: GRouter.router,
              );
            },
          ),
        ),
      ),
    );
  }
}
