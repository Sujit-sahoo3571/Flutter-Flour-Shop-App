import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final Map<String, double> price;
  final int id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    this.color = Colors.blueAccent,
  });
}

// item products
class Items {
  final int id;
  final String imageurl;
  final String title;
  final double? price;
  final String? netweight;

  Items(
      {required this.id,
      required this.imageurl,
      required this.title,
      required this.price,
      required this.netweight});
}

//people
class People {
  final int id;
  final String image;
  final String name;
  final String status;

  People(
      {required this.id,
      required this.image,
      required this.name,
      this.status = "online"});
}

const desc = 'Lorem ipsum dolor sit amet, consectetur'
    ' adipiscing elit. Vivamus egestas ipsum eu '
    'quam iaculis, sit amet sagittis lectus gravida.'
    ' Nulla pellentesque placerat augue eu dictum. Proin';
List<Product> products = [
  Product(
    id: 1,
    image: "assets/images/turmeric.jpg",
    title: "Turmeric(ହଳଦି) Powder",
    description: desc,
    price: {
      '100Gm': 20.0,
      '250Gm': 40.0,
      '500Gm': 80.0,
      '1KG': 160.0,
    },
  ),
  Product(
    id: 2,
    image: "assets/images/mustardoil1.jpg",
    title: "Mustard Oil(ସୋରିଷ ତେଲ)",
    description: desc,
    price: {
      '100Gm': 30.0,
      '250Gm': 70.0,
      '500Gm': 140.0,
      '1KG': 280.0,
    },
  ),
  Product(
    id: 3,
    image: "assets/images/mustardseeds.jpg",
    title: "Mustard(ସୋରିଷ)",
    description: desc,
    price: {
      '100Gm': 50.0,
      '250Gm': 100.0,
      '500Gm': 60.0,
      '1KG': 120.0,
    },
  ),
  Product(
    id: 4,
    image: "assets/images/garammasala.jpg",
    title: "GaramMasala(ଗରମ ମସଲା)",
    description: desc,
    price: {
      '100Gm': 70.0,
      '50Gm': 35.0,
      // '500Gm': 200.0,
      // '1KG': 400.0,
    },
  ),
  Product(
    id: 5,
    image: "assets/images/flour.jpg",
    title: "Flour(ଆଟା)",
    description: desc,
    price: {
      '100Gm': 50.0,
      '250Gm': 100.0,
      '500Gm': 200.0,
      '1KG': 400.0,
    },
  ),
  Product(
    id: 6,
    image: "assets/images/fingermillet.jpg",
    title: "Finger millet(ମାଣ୍ଡିଆ)",
    description: desc,
    price: {
      '100Gm': 10.0,
      '250Gm': 15.0,
      '500Gm': 30.0,
      '1KG': 60.0,
    },
  ),
  Product(
    id: 7,
    image: "assets/images/cuminseed.jpg",
    title: "cumin(ଜିରା)",
    description: desc,
    price: {
      '100Gm': 40.0,
      '250Gm': 90.0,
      '500Gm': 180.0,
      '1KG': 360.0,
    },
  ),
  Product(
    id: 8,
    image: "assets/images/cuminseed.jpg",
    title: "Meat masala",
    description: desc,
    price: {
      '100Gm': 90.0,
      '50Gm': 50.0,
      // '500Gm': 200.0,
      // '1KG': 400.0,
    },
  ),
  Product(
    id: 9,
    image: "assets/images/coriander.jpg",
    title: "Coriander(ଧଣିଆ)",
    description: desc,
    price: {
      '100Gm': 50.0,
      '250Gm': 100.0,
      '500Gm': 200.0,
      '1KG': 400.0,
    },
  ),
  Product(
    id: 10,
    image: "assets/images/chillypowder.jpg",
    title: "Chilly(ଲଙ୍କା) Powder",
    description: desc,
    price: {
      '100Gm': 30.0,
      '250Gm': 70.0,
      '500Gm': 140.0,
      '1KG': 280.0,
    },
  ),
  Product(
    id: 11,
    image: "assets/images/cuminseed.jpg",
    title: "masala",
    description: desc,
    price: {
      '100Gm': 50.0,
      '250Gm': 100.0,
      '500Gm': 200.0,
      '1KG': 400.0,
    },
  ),
  Product(
    id: 12,
    image: "assets/images/chatua.jpg",
    title: "Chatua(ଛତୁଆ)",
    description: desc,
    price: {
      '100Gm': 50.0,
      '250Gm': 100.0,
      '500Gm': 200.0,
      '1KG': 400.0,
    },
  ),
];

//list of people
List<People> people = [
  People(
    id: 1,
    image: "assets/images/manwoman/boy.jpg",
    name: 'Ishaan',
    status: "offline",
  ),
  People(
    id: 2,
    image: "assets/images/manwoman/woman8.jpg",
    name: "Inaya",
    status: "online",
  ),
  People(
    id: 3,
    image: "assets/images/manwoman/boy2.jpg",
    name: "Dhruv",
    status: "offline",
  ),
  People(
    id: 4,
    image: "assets/images/manwoman/woman5.jpg",
    name: "Shyla",
    status: "offline",
  ),
  People(
    id: 5,
    image: "assets/images/manwoman/boy3.jpg",
    name: "Amar",
    status: "offline",
  ),
  People(
    id: 6,
    image: "assets/images/manwoman/woman4.jpg",
    name: "Diya",
    status: "offline",
  ),
  People(
    id: 7,
    image: "assets/images/manwoman/woman3.jpg",
    name: "Ananya",
    status: "offline",
  ),
  People(
    id: 8,
    image: "assets/images/manwoman/woman2.jpg",
    name: "Tamia",
    status: "online",
  ),
  People(
    id: 9,
    image: "assets/images/manwoman/woman7.jpg",
    name: "Hundi",
    status: "offline",
  ),
  People(
    id: 10,
    image: "assets/images/manwoman/woman.jpg",
    name: "Yui",
    status: "online",
  ),
];
