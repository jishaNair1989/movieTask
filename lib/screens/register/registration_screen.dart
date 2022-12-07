import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_streaming_app/screens/login/login_screen.dart';

const List<String> list = <String>[
  'Developer',
  'Designer',
  'Architect',
  'Contractor'
];

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final prefs = await SharedPreferences.getInstance();
  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();

  bool validate = false;
  late String dropdownValue;
  late SharedPreferences prefs;

  final _key = 'curr';


  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register to Videofy'),
      ),
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                child: TextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Name",
                    errorText: validate ? 'Please enter your name' : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Password",
                    errorText: validate ? 'Please enter your password' : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    errorText: validate ? 'Please enter your email' : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                child: TextField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    errorText:
                        validate ? 'Please enter your phone number' : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                child: DropdownButtonFormField<String>(
                  alignment: Alignment.centerLeft,
                  value: dropdownValue,
                  // icon: const Icon(Icons.arrow_downward),
                  elevation: 5,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (String? newValue) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    prefs.setString(_key, dropdownValue);
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      saveData();
                    }),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) =>  LoginScreen()));
                  },
                  child: const Text('Alredy a member? Login'))
            ]),
      ),
    );
  }

  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name.text.isEmpty ? validate = true : validate = false;
      password.text.isEmpty ? validate = true : validate = false;
      email.text.isEmpty ? validate = true : validate = false;
      phone.text.isEmpty ? validate = true : validate = false;
      dropdownValue = prefs.getString(_key) ?? "Developer";
    });
    if (name.text.isNotEmpty &&
        password.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phone.text.isNotEmpty) {
      await prefs.setString("Username", name.text);
      await prefs.setString("Password", password.text);
      await prefs.setString("Email", email.text);
      await prefs.setString("Phone", phone.text);

      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) =>  LoginScreen()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 1000),
          content: Text(
            'Items Saved',
          )));
    }
  }
}
