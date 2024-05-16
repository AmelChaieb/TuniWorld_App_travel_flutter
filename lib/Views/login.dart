import 'package:flutter/material.dart';
import 'package:flutter_travel_app_ui/Components/button.dart';
import 'package:flutter_travel_app_ui/Components/colors.dart';
import 'package:flutter_travel_app_ui/Components/textfield.dart';
import 'package:flutter_travel_app_ui/JSON/welcome.dart';
import 'package:flutter_travel_app_ui/Views/profile.dart';
import 'package:flutter_travel_app_ui/Views/signup.dart';
import 'package:flutter_travel_app_ui/home/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../SQLite/database_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Our controllers
  //Controller is used to take the value from user and pass it to database
  final userNAme = TextEditingController();
  final password = TextEditingController();

  bool isChecked = false;
  bool isLoginTrue = false;

  final db = DatabaseHelper();

  Future<void> _saveUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', userNAme.text);
    prefs.setString('password', password.text);
    prefs.setBool('isChecked', isChecked);
  }
  //Login Method
  //We will take the value of text fields using controllers in order to verify whether details are correct or not
  login() async {
  Welcome? usrDetails = await db.getUser(userNAme.text);
  var res = await db.authenticate(Welcome(userNAme: userNAme.text, password: password.text));
  if (res == true) {
    if (isChecked) {
      _saveUserInfo();
    }
    // Si le résultat est correct, naviguer vers la page HomeScreen avec les détails de l'utilisateur
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(userDetails: usrDetails)),
    );
  } else {
    // Sinon, afficher un message d'erreur
    setState(() {
      isLoginTrue = true;
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper.jpg"),
            opacity: 0.1,// Change the image path accordingly
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png"),
                  InputField(hint: "Username", icon: Icons.account_circle, controller: userNAme),
                  InputField(hint: "Password", icon: Icons.lock, controller: password, passwordInvisible: true),
                  ListTile(
                    horizontalTitleGap: 2,
                    title: const Text("Remember me"),
                    leading: Checkbox(
                      activeColor: Colors.white, // Change the color accordingly
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                    ),
                  ),
                  Button(label: "LOGIN", press: login),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?", style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                        },
                        child: const Text("SIGN UP", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  isLoginTrue ? Text("Username or password is incorrect", style: TextStyle(color: Colors.red.shade900)) : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
