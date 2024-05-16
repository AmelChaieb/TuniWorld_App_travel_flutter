import 'package:flutter/material.dart';

class Monuments {
  final String image, title, description, location;
  final int price, id;
  Monuments({
    required this.location,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });
}

List<Monuments> monuments = [
  Monuments(
    id: 1,
    title: "",
    price: 320,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    image: "assets/images/image-2.jpg",
    location: 'Tunisia',
  ),
  Monuments(
    id: 2,
    title: "",
    price: 150,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    image: "assets/images/image-3.jpg",
    location: 'Tunisia',
  ),
 Monuments(
    id: 3,
    title: "",
    price: 240,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    image: "assets/images/image-3.jpg",
    location: 'Tunisia',
  ),
  Monuments(
    id: 4,
    title: "",
    price: 450,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    image: "assets/images/artiom_vallat.jpg",
    location: 'Tunisia',
  ),
];
