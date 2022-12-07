import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_streaming_app/controller/home_controller.dart';
import 'package:video_streaming_app/screens/login/login_screen.dart';

main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
    ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Chewy',
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
      home:  LoginScreen(),
    ),
    );
  }
}
