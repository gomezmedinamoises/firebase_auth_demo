import 'package:firebase_auth_demo/models/custom_error.dart';
import 'package:firebase_auth_demo/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/auth_repository_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              try {
                await ref.read(authRepositoryProvider).signOut();
              } on CustomError catch (error) {
                if (!context.mounted) return;
                errorDialog(context, error);
                print(error);
              }
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
