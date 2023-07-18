import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

bool get getFeatureToggle => false;

abstract class DeliveryHandler {
  void handle() {}
}

class BlackCatHandler implements DeliveryHandler {
  @override
  void handle() {
    print('Black Cat Send');
    // TODO: implement handle
  }
}

class ChungHwaHandler implements DeliveryHandler {
  @override
  void handle() {
    print('Chung Hwa Send');
    // TODO: implement handle
  }
}

class DeliveryDispatcher {
  final bool isToggleOn;

  final chungHwaHandler = ChungHwaHandler();

  final blackCatHandler = BlackCatHandler();

  DeliveryDispatcher(this.isToggleOn);

  void delivery() {
    if (isToggleOn) {
      return chungHwaHandler.handle();
    }
    return blackCatHandler.handle();
  }
}

void main() {
  getIt.registerSingleton<DeliveryDispatcher>(
      DeliveryDispatcher(getFeatureToggle));

  getIt<DeliveryDispatcher>().delivery();
}
