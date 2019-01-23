import 'package:flutter/material.dart';
import 'package:reactiveapp/cart/cart_bloc.dart';
import 'package:reactiveapp/catalog/catalog_bloc.dart';
import 'package:reactiveapp/services/catalog_service.dart';
import 'product/product_catalog.dart';

void main() { 
   // Initiate services.
  final catalogService = CatalogService();

  // Build top-level components.
  // In a real world app, this would also rope in HTTP clients and such.
  final catalog = CatalogBloc(catalogService);
  final cart = CartBloc();
  return  runApp(ReactiveApp(catalog, cart));
}