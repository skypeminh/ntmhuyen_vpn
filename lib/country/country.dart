import 'package:flutter/material.dart';

class Flag {
  final int id;
  final String title, image;

  Flag({
    required this.id,
    required this.image,
    required this.title,
  });
}

List<Flag> flaglist = [
  Flag(
    id: 1,
    image: 'assets/country/vietnam.png',
    title: "Vietnam",
  ),
  Flag(
    id: 2,
    image: "assets/country/canada.png",
    title: "Canada",
  ),
  Flag(
    id: 3,
    image: "assets/country/china.png",
    title: "China",
  ),
  Flag(
    id: 4,
    image: "assets/country/england.png",
    title: "England",
  ),
  Flag(
    id: 5,
    image: "assets/country/india.png",
    title: "India",
  ),
  Flag(
    id: 6,
    image: "assets/country/korea.png",
    title: "Korea",
  ),
  Flag(
    id: 7,
    image: "assets/country/mexico.png",
    title: "Mexico",
  ),
  Flag(
    id: 7,
    image: "assets/country/russia.png",
    title: "Russia",
  ),
  Flag(
    id: 7,
    image: "assets/country/singapore.png",
    title: "Singapore",
  ),
  Flag(
    id: 7,
    image: "assets/country/us.png",
    title: "Unit Stated",
  ),
];
