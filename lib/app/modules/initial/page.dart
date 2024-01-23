import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text('page inicial'),
            ),
            InkWell(
              onTap: () async => context.goNamed('home'),
              child: const Text('Ir para home'),
            )
          ],
        ),
      ),
    );
  }
}
