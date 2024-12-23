import 'package:firebase_auth_demo/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signin_provider.g.dart';

@riverpod
class Signin extends _$Signin {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    // Sign in logic
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signIn(
            email: email,
            password: password,
          ),
    );
  }
}
