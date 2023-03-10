import 'package:flutter/material.dart';

class Sneakers {
  Sneakers({
    this.image,
    this.name,
    this.price,
    this.brand,
    this.color,
    required this.id,
  });

  final int id;
  final String? image;
  final String? name;
  final String? price;
  final String? brand;
  final Color? color;
}
