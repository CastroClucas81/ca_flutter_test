import 'package:blue_challenge/src/modules/splash/ui/pages/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
    super.routes(r);
  }
}
