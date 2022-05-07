import 'package:get_it/get_it.dart';
import 'package:uudi_challenge/stores/cart_store.dart';
import 'package:uudi_challenge/stores/home_store.dart';

class Dependencies {
  static void init() {
    try {
      GetIt getIt = GetIt.I;
      getIt.registerSingleton<CartStore>(CartStore());
      getIt.registerSingleton<HomeStore>(HomeStore());
    } catch (e) {
      null;
    }
  }
}