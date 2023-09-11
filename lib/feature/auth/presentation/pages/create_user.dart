import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:new_task/feature/auth/presentation/cubit/auth_cubit.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../generated/app_String.dart';
import '../../../../generated/app_assets.dart';
import '../../../../token/cash_helper.dart';
import '../../../app/app_svg_picture.dart';
import '../../../app/widgets/app_text_field.dart';
import '../../../app/widgets/loading_indicator.dart';



class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AppSuccessfulPostCreateUser) {
          context.goNamed(GRouter.config.productRoutes.productScreen);
        }
      },
     child: BlocBuilder<AuthCubit, AuthState>(
       builder: (context, state) {
       return Scaffold(
      body: Padding(
        padding: REdgeInsetsDirectional.only(start:16.0 ,end: 16.0,),
        child: Center(
          child: FormBuilder(
            key: _formkey,
            child: ListView(
              children: [
                 const RSizedBox(
                    child: AppSvgPicture(Assets.lock,fit: BoxFit.cover,)
                ),
                33.verticalSpace,
                FadeInDown(
                  duration: const Duration(milliseconds: 2000),
                  child: AppTextField(
                    keyboardType: TextInputType.emailAddress,
                    title: AppString.email,
                    hintText: AppString.enter_Your_Email,
                    name: 'email',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                ),
                10.verticalSpace,
                FadeInDown(
                  duration: const Duration(milliseconds: 2000),
                  child: AppTextField(
                    keyboardType:TextInputType.name,
                    title: AppString.userName,
                    hintText: AppString.enter_Your_UserName,
                    name: 'username',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                10.verticalSpace,
                FadeInDown(
                  duration: const Duration(milliseconds: 2000),
                  child: AppTextField(
                    title: AppString.password,
                    hintText: AppString.enter_Your_Password,
                    isPasswordFiled: true,
                    validator:
                    FormBuilderValidators.compose([FormBuilderValidators.required(), FormBuilderValidators.minLength(6)]),
                    name: 'password',
                  ),
                ),
                50.verticalSpace,
                FadeInDown(
                  duration: const Duration(milliseconds: 2000),
                  child: ConditionalBuilder(
                    condition:state is! AppLoadingPostCreateUser ,
                    builder: (context) =>  ElevatedButton(
                      child: const Text(AppString.create_account),
                      onPressed: () {
                        _formkey.currentState!.save();
                        _formkey.currentState!.validate();
                        print(CachHelper.sharedPreferences.getString('token'));
                        if (_formkey.currentState!.isValid) {
                          context.read<AuthCubit>().CreateDio(
                              email:  _formkey.currentState!.value['email'],
                              username:  _formkey.currentState!.value['username']
                              ,password: _formkey.currentState!.value['password'],
                              context: context
                          );
                        }
                      },
                    ),
                    fallback:  (context) => const Center(
                      child:LoadingIndicator(),
                    ),
                  ),
                ),
                30.verticalSpace,
               
              ],
            ),
          ),
        ),
      ),
    );
  },
),
);
  }
}
