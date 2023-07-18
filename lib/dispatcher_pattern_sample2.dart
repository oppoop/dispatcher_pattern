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

abstract class DeliveryHandler {
  void delivery(UserCityRequest userCity);
}

class BlackCatHandler implements DeliveryHandler {
  @override
  void delivery(UserCityRequest userCity) {
    print('${userCity.city} is Send by Black Cat');
  }
}

class ChungHwaHandler implements DeliveryHandler {
  @override
  void delivery(UserCityRequest userCity) {
    print('${userCity.city} is Send by Chung Hwa');
  }
}

class DeliveryDispatcher {
  final Map<City, DeliveryHandler> handlers = {};

  void registerHandler(City city, DeliveryHandler handler) {
    handlers[city] = handler;
  }

  void dispatch(UserCityRequest city) {
    final handler = handlers[city.city];
    if (handler != null) {
      handler.delivery(city);
    } else {
      print('${city.city} can not support');
    }
  }
}

void main() {
  getIt.registerSingleton<DeliveryDispatcher>(DeliveryDispatcher());
  final handlerA = BlackCatHandler();
  final handlerB = ChungHwaHandler();
  final deliveryHandler = getIt<DeliveryDispatcher>();

  deliveryHandler.registerHandler(City.taichung, handlerA);
  deliveryHandler.registerHandler(City.tainan, handlerA);
  deliveryHandler.registerHandler(City.taipei, handlerB);

  final sendTaichung = UserCityRequest(City.taichung);
  final sendTaipei = UserCityRequest(City.taipei);
  final sendTainan = UserCityRequest(City.tainan);

  deliveryHandler.dispatch(sendTaichung);
  deliveryHandler.dispatch(sendTaipei);
  deliveryHandler.dispatch(sendTainan);

  deliveryHandler.dispatch(UserCityRequest(City.hongKong));
}
