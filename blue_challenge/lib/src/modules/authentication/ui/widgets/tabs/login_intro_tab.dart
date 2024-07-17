import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/design_system/assets/images/ds_image_enum.dart';
import 'package:blue_challenge/src/core/design_system/widgets/buttons/ds_button.dart';
import 'package:flutter/material.dart';

class LoginIntroTab extends StatelessWidget {
  final VoidCallback jumpToNext;

  const LoginIntroTab({required this.jumpToNext, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Image.asset(
                DSImageEnum.loginImage.path,
                fit: BoxFit.cover,
                height: 240,
              ),
              Text(
                S.of(context).goodToSeeYouHereAgain,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).howDoYouWantToConnect,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 20),
              DSButton(
                onPressed: jumpToNext,
                title: S.of(context).continueWithAnEmail,
              )
            ],
          ),
        ),
      ),
    );
  }
}
