import 'package:flutter/material.dart';
import 'package:reactiveapp/models/index.dart';

class Product extends CartItem{
    final String name;
    final MaterialColor color;
    Product(this.name, this.color):super(name, color);
}