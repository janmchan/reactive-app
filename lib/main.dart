import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/index.dart';
import 'cart_button.dart';
import 'product_catalog.dart';

void main() => runApp(ReactiveApp());

class ReactiveApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return ScopedModel(
      child: MaterialApp(
        title: 'Scoped Model',
        //theme: appTheme,
        home: ProductHomePage()
      ),
      model: CartModel(),
    );
  }
}

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