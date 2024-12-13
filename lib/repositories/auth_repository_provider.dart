import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/constants/firebase_constants.dart';
import 'package:firebase_auth_demo/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}

@riverpod
Stream<User?> authStateStream(Ref ref) {
  return firebaseAuth.authStateChanges();
}
