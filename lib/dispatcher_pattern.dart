import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class BlackCat {
  void delivery() {
    print('Black Cat Send');
  }
}

void main() {
  getIt.registerSingleton<BlackCat>(BlackCat());

  getIt<BlackCat>().delivery();
}
