import 'package:blue_challenge/src/modules/authentication/ui/widgets/tabs/login_authentication_tab.dart';
import 'package:blue_challenge/src/modules/authentication/ui/widgets/tabs/login_intro_tab.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pageController = PageController();

  void jumpToNext() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void jumpToPrevious() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          LoginIntroTab(jumpToNext: jumpToNext),
          LoginAuthenticationTab(jumpToPrevious: jumpToPrevious),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
