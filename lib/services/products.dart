import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final Map<String,double> price;
  final int size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    this.size = 0,
    this.color = Colors.blueAccent,
  });
}

const desc =
    'Lorem ipsum dolor sit amet, consectetur'
    ' adipiscing elit. Vivamus egestas ipsum eu '
    'quam iaculis, sit amet sagittis lectus gravida.'
    ' Nulla pellentesque placerat augue eu dictum. Proin';
List<Product> products = [
  Product(
      id: 1,
      image: "assets/images/turmeric.jpg",
      title: "Turmeric(ହଳଦି) Powder",
      description:desc,
      price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      }, ),
  Product(
      id: 2,
      image: "assets/images/mustardoil1.jpg",
      title: "Mustard Oil(ସୋରିଷ ତେଲ)",
      description:desc,
      price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
  Product(
      id: 3,
      image: "assets/images/mustardseeds.jpg",
      title: "Mustard(ସୋରିଷ)",
      description: desc,
      price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
  Product(
      id: 4,
      image: "assets/images/garammasala.jpg",
      title: "GaramMasala(ଗରମ ମସଲା)",
      description:desc,
     price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
  Product(
      id: 5,
      image: "assets/images/flour.jpg",
      title: "Flour(ଆଟା)",
      description: desc,
     price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
  Product(
      id: 6,
      image: "assets/images/fingermillet.jpg",
      title: "Finger millet(ମାଣ୍ଡିଆ)",
      description: desc,
      price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
  Product(
      id: 7,
      image: "assets/images/cuminseed.jpg",
      title: "cumin(ଜିରା)",
      description: desc,
      price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
  Product(
      id: 8,
      image: "assets/images/cuminseed.jpg",
      title: "masala",
      description: desc,
      price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
  Product(
      id: 9,
      image: "assets/images/coriander.jpg",
      title: "Coriander(ଧଣିଆ)",
      description: desc,
      price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
  Product(
      id: 10,
      image: "assets/images/chillypowder.jpg",
      title: "Chilly(ଲଙ୍କା) Powder",
      description: desc,
      price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
  Product(
      id: 11,
      image: "assets/images/cuminseed.jpg",
      title: "masala",
      description: desc,
      price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
  Product(
      id: 12,
      image: "assets/images/chatua.jpg",
      title: "Chatua(ଛତୁଆ)",
      description: desc,
     price: {
        '100Gm': 50.0,
        '250Gm': 100.0,
        '500Gm':200.0,
        '1KG': 400.0,
      },),
];
