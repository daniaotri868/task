import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:new_task/feature/auth/presentation/models/get_profile.dart';

import '../../../../token/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late final AuthRepo _authRepo;
  AuthCubit() : super(AuthInitial()) {
    _authRepo = AuthRepo();
  }


  void loginDio({required String email, required String password, required context}) async {
    emit(AppLoadingPostLogin());

    Either<String, String> result = await _authRepo.loginUser(username: email, password: password);

    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("There is an error")));
      emit(AppErrorPostLogin());
      print(l);
      // Show error
    }, (r) {
      emit(AppSuccessfulPostLogin());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("It's done")));
      print("Successful");
      // Save user
    });
  }


  void CreateDio({
    required String username,
    required String email,
    required String password,
    required context,
  }) async {
    emit(AppLoadingPostCreateUser());
    Either<String, Map<String, dynamic>> result =
    await _authRepo.createUser(
        username: username,
        email: email,
        password: password,
    );
    result.fold((l) {
      emit(AppErrorPostCreateUser());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("There is an error")));
      print("Error");
      //show error
    }, (r) {
      emit(AppSuccessfulPostCreateUser());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("It's done")));
      // Navigator.push(context, MaterialPageRoute(builder: (context) => start(),));
      print("successful");

      //save user
    });
  }

  void ShowProfile() async {
    emit(AppLoadingGetProfile());
    Either<String, List<GetProfile>> result =
    await _authRepo.getProfile();
    result.fold((l) {
      emit(AppErrorGetProfile());
      print("Error$l");
      //show error
    }, (r) {
      emit(AppSuccessfulGetProfile(r as List<GetProfile>));

    });
  }
}
