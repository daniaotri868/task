part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

//login

class AppErrorPostLogin extends AuthState {}
class AppSuccessfulPostLogin extends AuthState {}
class AppLoadingPostLogin extends AuthState {}

//create user

class AppErrorPostCreateUser extends AuthState {}
class AppSuccessfulPostCreateUser extends AuthState {}
class AppLoadingPostCreateUser extends AuthState {}


class AppLoadingGetProfile extends AuthState {}
class AppSuccessfulGetProfile extends AuthState {
  List<GetProfile> result;
  AppSuccessfulGetProfile(this.result);
}
class AppErrorGetProfile extends AuthState {}

