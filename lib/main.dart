import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:video_streaming_app/controller/api_service.dart';
import 'package:video_streaming_app/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child:  MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}