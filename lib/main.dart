import 'package:deeplink_native/routes/delegate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        // scaffoldBackgroundColor: AppColors.color_12,
      ),
      debugShowCheckedModeBanner: false,
      // theme: appcolortheme,
      routerConfig: GoRootDelegate.router,
    ),
  );
}
