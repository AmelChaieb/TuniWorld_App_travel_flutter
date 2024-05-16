import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_travel_app_ui/JSON/welcome.dart';
import 'package:flutter_travel_app_ui/Views/profile.dart';
import 'package:flutter_travel_app_ui/screens/activities_screen.dart';


import '../constants.dart';
import '../models/Monuments.dart';
import '../screens/RestaurantScreen .dart';
import '../screens/activity_details_screen.dart';
import 'components/categoryCards.dart';

class HomeScreen extends StatefulWidget {
  final Welcome? userDetails; // Ajoutez cette ligne

  const HomeScreen({Key? key, this.userDetails}) : super(key: key);
   static const routeName = '/home';
   

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedicon = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
         actions: [
          IconButton(
            onPressed: () {
              // Vérifier si les détails de l'utilisateur sont disponibles avant de naviguer vers la page de profil
              if (widget.userDetails != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile(profile: widget.userDetails!)),
                );
              } else {
           }
            },
            icon: Icon(
              Icons.person,
              color: kPrimaryColor,
              size: 30,
            ),
          ),
        ],
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bienvenue",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Découvrez le monde!",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: kPrimaryColor.withOpacity(0.3),
          currentIndex: selectedicon,
          onTap: (value) {
            setState(() {
              selectedicon = value;
            });
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
          ]),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Rechercher ',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.sort_by_alpha,
                            size: 30,
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Découvrez la tunisie",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Plus",
                        style: TextStyle(color: kPrimaryColor),
                      ))
                ],
              ),
              //category section now we will build
              Container(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      title: "Places",
                      press: () {
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ActivitiesScreen()));
                      },
                    ),
                    CategoryCard(
                      title: "Restaurant",
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestaurantScreen()));
                      },
                    ),
                    CategoryCard(
                      title: "Monuments",
                      press: () {},
                    ),
                    CategoryCard(
                      title: "station",
                      press: () {},
                    ),
                  ],
                ),
              ),
              // first of all we will create model of our project
              Container(
                height: 400,
                child: Swiper(
                  itemCount: monuments.length,
                  itemWidth: 300,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 400,
                              width: 300,
                              child: Card(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      monuments[index].image,
                                      width: 300,
                                      height: 240,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(monuments[index].title,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: kPrimaryColor,
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                monuments[index].location,
                                                style: TextStyle(
                                                    color: kSecondaryColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.bookmark,
                                                    color: kPrimaryColor,
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
