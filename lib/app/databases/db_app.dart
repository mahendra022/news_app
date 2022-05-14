import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/country_model.dart';

List<CountryModel> dataCountry = [
  CountryModel(
      name: "us",
      img:
          "https://ilmupengetahuanumum.com/wp-content/uploads/2014/01/bendera-amerika-serikat.jpg"),
  CountryModel(
      name: "id",
      img:
          "https://ilmupengetahuanumum.com/wp-content/uploads/2013/12/Bendera-Indonesia.jpg"),
  CountryModel(
      name: "fr",
      img:
          "https://ilmupengetahuanumum.com/wp-content/uploads/2014/01/bendera-perancis.png")
];

List<CategoryModel> dataCategory1 = [
  CategoryModel(
      title: 'Business',
      icon: Icons.track_changes,
      color: Colors.blueAccent[700]),
  CategoryModel(
      title: 'Health', icon: Icons.health_and_safety, color: Colors.pink[700]),
  CategoryModel(
      title: 'General',
      icon: Icons.change_circle,
      color: Colors.lightBlueAccent),
];

List<CategoryModel>? dataCategory2 = [
  CategoryModel(
      title: 'Entertainment',
      icon: Icons.sports_esports,
      color: Colors.amber[600]),
  CategoryModel(title: 'Science', icon: Icons.science, color: Colors.pink[200]),
  CategoryModel(
      title: 'Sports', icon: Icons.sports_soccer, color: Colors.indigo[700]),
  CategoryModel(
      title: 'Technology', icon: Icons.device_hub, color: Colors.orange[900]),
];
