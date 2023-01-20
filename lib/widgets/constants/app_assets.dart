abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  final String sneakers1 = 'assets/images/sneaker_01.png';
  final String sneakers2 = 'assets/images/sneaker_02.png';
  final String sneakers3 = 'assets/images/sneaker_03.png';
  final String sneakers4 = 'assets/images/sneaker_04.png';
}

class _Svg {
  const _Svg();

  final String cabinet = 'assets/svg/cabinet.svg';
  final String cart = 'assets/svg/cart.svg';
  final String favorite = 'assets/svg/favorite.svg';
  final String homePin = 'assets/svg/home_pin.svg';
  final String home = 'assets/svg/home.svg';
  final String address = 'assets/svg/address.svg';
}
