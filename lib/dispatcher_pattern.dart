import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Delivery {
  void delivery() {
    print('Black Cat Send');
  }
}

void main() {
  getIt.registerSingleton<Delivery>(Delivery());

  getIt<Delivery>().delivery();
}
