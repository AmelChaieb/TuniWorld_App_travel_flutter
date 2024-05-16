import 'package:flutter/material.dart';
import 'package:flutter_travel_app_ui/Components/colors.dart';
import 'package:flutter_travel_app_ui/Views/login.dart';
import 'package:flutter_travel_app_ui/Views/signup.dart';

import '../Components/button.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Authentication",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              const Text(
                "Authenticate to access your vital information",
                style: TextStyle(color: Colors.grey),
              ),
              Expanded(child: Image.asset("assets/startup.png")),
              Button(label: "LOGIN", press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
              }),
              Button(label: "SIGN UP", press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupScreen()));
              }),
            ],
          ),
        ),
      )),
    );
  }
}
