import 'package:firebase_auth_demo/config/router/route_names.dart';
import 'package:firebase_auth_demo/models/custom_error.dart';
import 'package:firebase_auth_demo/screens/auth/signin/signin_provider.dart';
import 'package:firebase_auth_demo/screens/widgets/buttons.dart';
import 'package:firebase_auth_demo/screens/widgets/form_fields.dart';
import 'package:firebase_auth_demo/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    ref.read(signinProvider.notifier).signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(signinProvider, (prev, next) {
      next.whenOrNull(
        error: (error, stackTrace) =>
            errorDialog(context, error as CustomError),
      );
    });

    final signInState = ref.watch(signinProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                children: [
                  const FlutterLogo(size: 150),
                  const SizedBox(height: 20),
                  EmailFormField(emailController: _emailController),
                  const SizedBox(height: 20),
                  PasswordFormField(
                    passwordController: _passwordController,
                    labelText: 'Password',
                  ),
                  const SizedBox(height: 20),
                  CustomFilledButton(
                    onPressed: signInState.maybeWhen(
                      loading: () => null,
                      orElse: () => _submit,
                    ),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    child: Text(
                      signInState.maybeWhen(
                        loading: () => 'Submitting...',
                        orElse: () => 'Sign In',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not member?'),
                      const SizedBox(width: 10),
                      CustomTextButton(
                        onPressed: signInState.maybeWhen(
                          loading: () => null,
                          orElse: () =>
                              () => context.goNamed(RouteNames.signup),
                        ),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        child: const Text('Sign up!'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomTextButton(
                    onPressed: signInState.maybeWhen(
                      loading: () => null,
                      orElse: () =>
                          () => context.goNamed(RouteNames.resetPassword),
                    ),
                    foregroundColor: Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    child: const Text('Forgot password?'),
                  )
                ].reversed.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
