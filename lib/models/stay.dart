import 'package:flutter/material.dart';

class Stay {
  const Stay({
    required this.name,
    required this.place,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.icon,
    required this.color,
  });

  final String name;
  final String place;
  final String price;
  final String rating;
  final String reviews;
  final IconData icon;
  final Color color;
}
