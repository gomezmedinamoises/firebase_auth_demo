import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/config/router/route_names.dart';
import 'package:firebase_auth_demo/repositories/auth_repository_provider.dart';
import 'package:firebase_auth_demo/screens/auth/reset_password/reset_password_screen.dart';
import 'package:firebase_auth_demo/screens/auth/signin/signin_screen.dart';
import 'package:firebase_auth_demo/screens/auth/signup/signup_screen.dart';
import 'package:firebase_auth_demo/screens/auth/verify_email/verify_email_screen.dart';
import 'package:firebase_auth_demo/screens/content/change_password/change_password_screen.dart';
import 'package:firebase_auth_demo/screens/content/home/home_screen.dart';
import 'package:firebase_auth_demo/screens/splash/firebase_error_screen.dart';
import 'package:firebase_auth_demo/screens/splash/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../screens/page_not_found.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateStreamProvider);
  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      if (authState is AsyncLoading<User?>) {
        return '/splash';
      }

      if (authState is AsyncError<User?>) {
        return '/firebaseError';
      }

      final authenticated = authState.valueOrNull != null;

      final authenticating = (state.matchedLocation == '/signin') ||
          (state.matchedLocation == '/signup') ||
          (state.matchedLocation == '/resetPassword');

      if (authenticated == false) {
        return authenticating ? null : '/signup';
      }

      /* if (!firebaseAuth.currentUser!.emailVerified) {
        return '/verifyEmail';
      }*/

      final verifyingEmail = state.matchedLocation == '/verifyEmail';
      final splashing = state.matchedLocation == '/splash';

      return (authenticating || verifyingEmail || splashing) ? '/home' : null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: RouteNames.splash,
        builder: (context, state) {
          print('Splash screen!');
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/firebaseError',
        name: RouteNames.firebaseError,
        builder: (context, state) {
          print('Firebase error screen!');
          return const FirebaseErrorScreen();
        },
      ),
      GoRoute(
        path: '/signin',
        name: RouteNames.signin,
        builder: (context, state) {
          print('SignIn screen!');
          return const SignInScreen();
        },
      ),
      GoRoute(
        path: '/signup',
        name: RouteNames.signup,
        builder: (context, state) {
          print('SignUp screen!');
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: '/resetPassword',
        name: RouteNames.resetPassword,
        builder: (context, state) {
          print('Reset password screen!');
          return const ResetPasswordScreen();
        },
      ),
      GoRoute(
        path: '/verifyEmail',
        name: RouteNames.verifyEmail,
        builder: (context, state) {
          print('Verify email screen!');
          return const VerifyEmailScreen();
        },
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) {
          print('Home screen!');
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            path: '/changePassword',
            name: RouteNames.changePassword,
            builder: (context, state) {
              print('Change password screen!');
              return const ChangePasswordScreen();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return PageNotFoundScreen(
        errorMessage: state.error.toString(),
      );
    },
  );
}
