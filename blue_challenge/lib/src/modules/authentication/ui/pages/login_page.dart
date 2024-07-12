import 'package:asp/asp.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/atoms/authentication_atom.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/dtos/credential_dto.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => authenticationState.value);

    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              label: Text('E-mail'),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              loginWithEmailAndPasswordState.setValue(CredentialDTO(
                email: emailController.text,
                password: passwordController.text,
              ));
            },
            icon: const Icon(Icons.login),
            label: const Text('Enter'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
