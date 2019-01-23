import 'package:flutter/material.dart';
import 'package:reactiveapp/shared/cart_button.dart';
import 'package:reactiveapp/models/cart_model.dart';
import 'package:reactiveapp/product/product_catalog.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductHomePage extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
        actions: <Widget>[
          ScopedModelDescendant<CartModel>(builder: (context, _, model) => 
          CartButton(model.itemCount)
          )
          
        ],
      ),
      body: ProductCatalog(),
    );
  }
}