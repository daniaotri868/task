import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_task/commen/build_context.dart';
import 'package:new_task/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:new_task/generated/app_assets.dart';
import '../../../../generated/app_String.dart';
import '../../../app/widgets/app_text_field.dart';
import '../widgets/shimmer_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    context.read<AuthCubit>().ShowProfile();
    // TODO: implement initState
    super.initState();
  }

  TextEditingController controllerUserName=TextEditingController();
  TextEditingController controllerPhone=TextEditingController();
  TextEditingController controllerEmail=TextEditingController();
  @override
  Widget build(BuildContext context) {
  
    return BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    controllerUserName.text=(state is AppSuccessfulGetProfile? state.result[0].username:"")!;
    controllerEmail.text=(state is AppSuccessfulGetProfile? state.result[0].email:"")!;
    controllerPhone.text=(state is AppSuccessfulGetProfile? state.result[0].phone:"")!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ConditionalBuilder(
        condition: state !is AppSuccessfulGetProfile,
        builder: (context) =>
            Container(
            padding: REdgeInsetsDirectional.only(start: 20.w,end: 20.w,top: 50.h),
            child:SingleChildScrollView(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: () {
                    context.pop();
                  }, icon: Icon(Icons.arrow_back_ios,color: context.colorScheme.primary,)),
                  Center(child: Image.asset(Assets.profile,width: 230.w,height: 170.h)),
                  Padding(
                    padding:REdgeInsetsDirectional.only(start: 20.w,end: 20.w) ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Your Profile Details :",style: TextStyle(fontSize: 20)),
                        RSizedBox(height: 20.h,),
                        AppTextField(
                          readOnly: true,
                          title: AppString.email,
                          name: 'Email',
                          controller: controllerEmail,
                        ),
                        RSizedBox(height: 20.h,),
                        AppTextField(
                          readOnly: true,
                          title: AppString.userName,
                          name: 'UserName',
                          controller: controllerUserName,
                        ),
                        RSizedBox(height: 20.h,),
                        AppTextField(
                          readOnly: true,
                          title: AppString.phone,
                          name: 'Password',
                          controller: controllerPhone,
                        ),

                        RSizedBox(height: 20.h,),

                      ],
                    ),
                  ),



                ],
              ),
            )
        ),
        fallback: (context) => const ShimmerProfile()
      )
    );
  },
);
  }
}
