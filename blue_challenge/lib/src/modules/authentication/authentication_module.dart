import 'package:blue_challenge/src/modules/authentication/data/services/firebase_authentication_service.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/reducers/authentication_reducer.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/services/i_authentication_service.dart';
import 'package:blue_challenge/src/modules/authentication/ui/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    i.add<IAuthenticationService>(FirebaseAuthenticationService.new);
    i.addSingleton(AuthenticationReducer.new);
    super.exportedBinds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/login', child: (context) => const LoginPage());
    super.routes(r);
  }
}
