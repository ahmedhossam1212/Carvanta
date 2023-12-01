import 'package:carvanta/config/theme/app_theme.dart';
import 'package:carvanta/presentation/view/screens/login_screen.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: const LoginScreen(),
    );
  }
}
