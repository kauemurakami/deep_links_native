import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Home',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            InkWell(
              onTap: () => context.pop(),
              child: const Center(
                  child: Text(
                'Initial',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }
}
