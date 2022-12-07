import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_streaming_app/screens/home/home_screen.dart';
import 'package:video_streaming_app/screens/register/registration_screen.dart';

import '../../controller/home_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    // bool validate = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login to Videofy'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "username",
                errorText: validate ? 'Please enter your name' : null,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Password",
                errorText: validate ? 'Please enter passsword' : null,
              ),
            ),
          ),
          SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            side: const BorderSide(color: Colors.blue)))),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  onLogin();
                }),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => RegisterScreen()));
              },
              child: Text('Dont have account?Register'))
        ],
      ),
    );
  }

  onLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name.text.isEmpty ? validate = true : validate = false;
      password.text.isEmpty ? validate = true : validate = false;
    });
    if (name.text == prefs.getString("Username") &&
        name.text.isNotEmpty &&
        password.text.isNotEmpty &&
        password.text == prefs.getString("Password")) {
      await Provider.of<HomeViewModel>(context, listen: false)
          .getHomeData(context)
          .then((_) {
//save User
        //context.read<AuthProvider>().saveUser(user);
        // PushFunctions.pushReplace(context, const MainScreen());

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 1000),
          content: Text(
            'Invalid Credentials',
          )));
    }
  }
}
