import 'package:carvanta_i/config/theme/app_theme.dart';
import 'package:carvanta_i/presentation/manager/cubit/auth_cubit.dart';
import 'package:carvanta_i/presentation/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        home: const LoginScreen(),
      ),
    );
  }
}
