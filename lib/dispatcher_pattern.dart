import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class BlackCatHandler {
  void delivery() {
    print('Black Cat Send');
  }
}

void main() {
  getIt.registerSingleton<BlackCatHandler>(BlackCatHandler());

  getIt<BlackCatHandler>().delivery();
}
