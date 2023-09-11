part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}



class AppLoadingGetProduct extends ProductState {}
class AppSuccessfulGetProduct extends ProductState {
  List<AllProduct> result;
  AppSuccessfulGetProduct(this.result);
}
class AppErrorGetProduct extends ProductState {}



// class AppLoadingGetCart extends ProductState {}
// class AppSuccessfulGetCart extends ProductState {
//   List<GetCart> result;
//   AppSuccessfulGetCart(this.result);
// }
// class AppErrorGetCart extends ProductState {}



class AppLoadingPostCart extends ProductState {}
class AppSuccessfulPostCart extends ProductState {
  // List<GetCart> result;
  // AppSuccessfulPostCart(this.result);
}
class AppErrorPostCart extends ProductState {}



class AppGetDataBase extends ProductState {
  List result;
  AppGetDataBase(this.result);
}


//DataBase
class AppCreateDataBase extends ProductState {}
class AppLoadingGetDataBase extends ProductState {}
class AppInsertDataBase extends ProductState {}
class AppDeleteDataBase extends ProductState {}




