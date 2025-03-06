import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/features/auth/screens/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.greyBackgroundCOlor,
          colorScheme: ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          )),
      home: const AuthScreen(),
    );
  }
}
