import 'package:asp/asp.dart';
import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/design_system/utils/enums/ds_notification_type_enum.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/atoms/authentication_atom.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/dtos/credential_dto.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/states/authentication_state.dart';
import 'package:blue_challenge/src/core/design_system/widgets/buttons/ds_button.dart';
import 'package:blue_challenge/src/core/design_system/widgets/form/ds_input_text.dart';
import 'package:blue_challenge/src/core/design_system/widgets/notification/ds_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginAuthenticationTab extends StatefulWidget {
  final VoidCallback jumpToPrevious;

  const LoginAuthenticationTab({required this.jumpToPrevious, super.key});

  @override
  State<LoginAuthenticationTab> createState() => _LoginAuthenticationTabState();
}

class _LoginAuthenticationTabState extends State<LoginAuthenticationTab> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  bool showPassword = false;

  void showError(AuthenticationState? state) {
    if (state is ErrorAuthentication) {
      DSSnackBar.show(
        context,
        message: state.message,
        type: DSNotificationTypeEnum.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    context.callback(() => authenticationState.value, showError);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).enter),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: widget.jumpToPrevious,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  S.of(context).welcomeBack,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  S.of(context).fillInTheData,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                DSInputText(
                  controller: emailController,
                  focusNode: emailNode,
                  keyboardType: TextInputType.emailAddress,
                  hintText: S.of(context).email,
                  prefixIcon: const Icon(Icons.email),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(height: 16),
                StatefulBuilder(
                  builder: (context, setState) {
                    return DSInputText(
                      controller: passwordController,
                      focusNode: passwordNode,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: S.of(context).password,
                      validator: FormBuilderValidators.required(),
                      obscureText: !showPassword,
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(showPassword ? Icons.lock_open : Icons.lock),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                DSButton(
                  title: S.of(context).enter,
                  icon: Icons.send,
                  isLoading: context.select(() => authenticationState.value)
                      is LoadingAuthentication,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      emailNode.unfocus();
                      passwordNode.unfocus();

                      loginWithEmailAndPasswordState.setValue(
                        CredentialDTO(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    emailNode.dispose();
    passwordController.dispose();
    passwordNode.dispose();
    super.dispose();
  }
}
