import 'dispatcher_pattern.dart';

enum City {
  taichung,
  taipei,
  tainan,
  hongKong,
  unKnown,
}

class UserCityRequest {
  final City city;

  UserCityRequest(this.city);
}

abstract class DeliveryController {
  void delivery(UserCityRequest userCity);
}

class BlackCatController implements DeliveryController {
  @override
  void delivery(UserCityRequest userCity) {
    print('${userCity.city} is Send by Black Cat');
  }
}

class ChungHwaController implements DeliveryController {
  @override
  void delivery(UserCityRequest userCity) {
    print('${userCity.city} is Send by Chung Hwa');
  }
}

class DeliveryDispatcher {
  final Map<City, DeliveryController> controllers = {};

  void registerController(City city, DeliveryController controller) {
    controllers[city] = controller;
  }

  void dispatch(UserCityRequest city) {
    final controller= controllers[city.city];
    if (controller != null) {
      controller.delivery(city);
    } else {
      print('${city.city} can not support');
    }
  }
}

void main() {
  getIt.registerSingleton<DeliveryDispatcher>(DeliveryDispatcher());
  final blackCat = BlackCatController();
  final chungHwa = ChungHwaController();
  final deliveryController = getIt<DeliveryDispatcher>();

  deliveryController.registerController(City.taichung, blackCat);
  deliveryController.registerController(City.tainan, blackCat);
  deliveryController.registerController(City.taipei, chungHwa);

  final sendTaichung = UserCityRequest(City.taichung);
  final sendTaipei = UserCityRequest(City.taipei);
  final sendTainan = UserCityRequest(City.tainan);

  deliveryController.dispatch(sendTaichung);
  deliveryController.dispatch(sendTaipei);
  deliveryController.dispatch(sendTainan);

  deliveryController.dispatch(UserCityRequest(City.hongKong));
}
