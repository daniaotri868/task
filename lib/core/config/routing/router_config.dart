class RouterConfiguration {
  RouterConfiguration.init();

  final String kRootRoute = '/';
  final authRoutes = const _AuthRoutes._();
  final productRoutes = const _ProductRoutes._();
  final profileRoutes = const _ProfileRoutes._();
}

class _AuthRoutes{
  const _AuthRoutes._();

  final String login = '/login';
  final String createUser = 'createUser';
}


class _ProductRoutes{
  const _ProductRoutes._();

  final String productScreen = '/productScreen';
  final String detailProductScreen = 'detailProductScreen';
  final String getCartScreen = 'getCartScreen';
}
class _ProfileRoutes{
  const _ProfileRoutes._();

  final String profileScreen = 'ProfileScreen';
}


