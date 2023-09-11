import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:new_task/commen/build_context.dart';
import 'package:new_task/feature/auth/presentation/cubit/auth_cubit.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../generated/app_String.dart';
import '../../../app/widgets/app_text_field.dart';
import '../../../app/widgets/loading_indicator.dart';


class ContainerLogin extends StatefulWidget {
  ContainerLogin({Key? key}) : super(key: key);

  @override
  State<ContainerLogin> createState() => _ContainerLoginState();
}

class _ContainerLoginState extends State<ContainerLogin> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            height: MediaQuery
                .sizeOf(context)
                .height/1.45,
            width: MediaQuery
                .sizeOf(context)
                .width,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            padding: REdgeInsetsDirectional.only(
              top: 15,
              start: 17,
              end: 17,
            ),
            child: SingleChildScrollView(
              child: FormBuilder(
                 key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 2000),
                      child: Text(
                        AppString.hello,
                        style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    35.verticalSpace,
                    // 12.verticalSpace,
                    FadeInDown(
                      duration: const Duration(milliseconds: 2000),
                      child: AppTextField(
                        controller: emailController,
                        title: AppString.email,
                        hintText: AppString.enter_Your_Email,
                        validator:
                        FormBuilderValidators.compose([FormBuilderValidators.required(), ]),
                        name: 'email',
                      ),
                    ),
                    12.verticalSpace,
                    FadeInDown(
                      duration: const Duration(milliseconds: 2000),
                      child: AppTextField(
                        controller: passwordController,
                        title: AppString.password,
                        hintText: AppString.enter_Your_Password,
                        isPasswordFiled: true,
                        validator:
                        FormBuilderValidators.compose([FormBuilderValidators.required(), FormBuilderValidators.minLength(6)]),
                        name: 'password',
                      ),
                    ),
                    FadeInDown(
                      duration: const Duration(milliseconds: 2000),
                      child: TextButton(
                        onPressed: () {
                          context.go("${GRouter.config.authRoutes.login}/${GRouter.config.authRoutes.createUser}");
                        },
                        style: ElevatedButton.styleFrom(
                          textStyle: context.textTheme.bodyMedium,
                          foregroundColor: context.colorScheme.scrim,
                        ),
                        child:  Text(AppString.create_account,style: TextStyle(color: context.colorScheme.primary)),
                      ),
                    ),
                    FadeInDown(
                      duration: const Duration(milliseconds: 2300),
                      child: ConditionalBuilder(
                        condition:state is! AppLoadingPostLogin ,
                        builder: (context) => ElevatedButton(
                          child:const Text(AppString.login),
                          onPressed: ( ) {
                            // print(   CachHelper.sharedPreferences.getString('token')
                            // );
                            _formkey.currentState!.save();
                            _formkey.currentState!.validate();
                               if (_formkey.currentState!.isValid) {
                                 context.read<AuthCubit>().loginDio(
                                     email:  _formkey.currentState!.value['email'],
                                     password: _formkey.currentState!.value['password'],
                                     context: context
                                 );
                               }

                          },
                        ),
                        fallback:  (context) => const Center(
                          child:LoadingIndicator(),
                        ),
                      ),
                    )

                  ],
                ),
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
