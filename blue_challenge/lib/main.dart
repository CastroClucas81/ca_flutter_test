import 'package:asp/asp.dart';
import 'package:blue_challenge/firebase_options.dart';
import 'package:blue_challenge/src/app_module.dart';
import 'package:blue_challenge/src/app_widget.dart';
import 'package:blue_challenge/src/core/services/data/database_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DatabaseManager().start();

  FlutterNativeSplash.remove();

  runApp(
    RxRoot(
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
