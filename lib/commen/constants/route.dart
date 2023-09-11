abstract class EndPoints {
  EndPoints._();

  static const baseUrl = "https://fakestoreapi.com/";


  static const auth = _Auth();
  static const product = _Product();
  static const profile = _Profile();

}

class _Auth {
  const _Auth();

  final login = 'auth/login';
  final createUser = 'users';
}



class _Product {
  const _Product();

  final getProductData = 'products';
}
class _Profile {
  const _Profile();

  final getUserData = 'users/';
}
