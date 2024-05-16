import 'package:flutter/material.dart';
import 'package:flutter_travel_app_ui/Components/colors.dart';
import 'package:flutter_travel_app_ui/JSON/welcome.dart';
import 'package:flutter_travel_app_ui/Views/login.dart';
import 'package:flutter_travel_app_ui/constants.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importez la page de login ici

class Profile extends StatelessWidget {
  final Welcome? profile;
  const Profile({Key? key, this.profile}) : super(key: key);
  static const routeName = '/profile';

  Future<void> clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        clearPreferences();
                        // Logique de déconnexion
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      },
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 77,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/sou.jpg"),
                    radius: 75,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  profile!.fullName ?? "",
                  style: TextStyle(fontSize: 28, color: primaryColor),
                ),
                Text(
                  profile!.email ?? "",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                ListTile(
                  leading: Icon(Icons.person, size: 30),
                  subtitle: Text("Full name"),
                  title: Text(profile!.fullName ?? ""),
                ),
                ListTile(
                  leading: Icon(Icons.email, size: 30),
                  subtitle: Text("Email"),
                  title: Text(profile!.email ?? ""),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle, size: 30),
                  subtitle: Text(profile!.userNAme),
                  title: Text("admin"),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: kPrimaryColor.withOpacity(0.3),
        currentIndex: 0,
        onTap: (value) {
          // Gérez les clics sur la barre de navigation ici
        },
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Favoris",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Paramètres",
          ),
        ],
      ),
    );
  }
}
