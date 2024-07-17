import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:blue_challenge/src/core/design_system/assets/images/ds_image_enum.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/atoms/authentication_atom.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), checkAuthenticationAction.call);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              DSImageEnum.pokedex.path,
              fit: BoxFit.cover,
              height: 80,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const LinearProgressIndicator(
                color: DSColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
