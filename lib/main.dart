import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_travel_app_ui/Views/auth.dart';
import 'package:flutter_travel_app_ui/Views/login.dart';
import 'package:flutter_travel_app_ui/Views/profile.dart';
import 'package:flutter_travel_app_ui/Views/signup.dart';
import 'package:flutter_travel_app_ui/home/homescreen.dart';
import 'screens/hotels_screen.dart';
import 'screens/activities_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isOnboardingComplete = prefs.getBool('isOnboardingComplete');
  bool? isLoggedIn = prefs.getBool('isChecked');

  String initialRoute;
  if (isOnboardingComplete == null || isOnboardingComplete == false) {
    initialRoute = '/onboarding';
  } else if (isLoggedIn == true) {
    initialRoute = '/home';
  } else {
    initialRoute = '/login';
  }

  runApp(TravelApp(initialRoute: initialRoute));
}

class TravelApp extends StatelessWidget {
  final String initialRoute;

  const TravelApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: initialRoute,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/activities': (context) => const ActivitiesScreen(),
        '/hotels': (context) => const HotelsScreen(),
        '/auth': (context) => const AuthScreen(),
        '/login': (context) => const LoginScreen(),
        '/profile': (context) => const Profile(),
        '/signup': (context) => const SignupScreen(),

      },
      builder: (context, child) {
        return _TravelApp(child: child!);
      },
    );
  }
}

class _TravelApp extends StatefulWidget {
  final Widget child;

  const _TravelApp({Key? key, required this.child}) : super(key: key);

  @override
  State<_TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<_TravelApp> {
  bool isOnboarding = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 247, 248),
      body: isOnboarding ? _buildOnboarding(context) : widget.child,
    );
  }

  Widget _buildOnboarding(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/image-2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.45,
          bottom: MediaQuery.of(context).size.height * 0.1,
          left: 30,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hidden Treasures of Tunisia',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 65,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isOnboardingComplete', true);
                setState(() {
                  isOnboarding = false;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Explore Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

