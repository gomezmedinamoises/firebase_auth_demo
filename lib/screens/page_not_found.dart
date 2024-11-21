import 'package:firebase_auth_demo/config/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageNotFoundScreen extends StatelessWidget {
  final String errorMessage;

  const PageNotFoundScreen({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                errorMessage,
                style: const TextStyle(fontSize: 18, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(RouteNames.home);
                },
                child: const Text(
                  'Home',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
