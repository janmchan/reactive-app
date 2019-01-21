import 'package:flutter/material.dart';
import 'package:reactiveapp/product_square.dart';
import 'package:scoped_model/scoped_model.dart';
import 'cart_button.dart';
import 'models/index.dart';

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

class ProductCatalog extends StatelessWidget{

  final products =  [
      Product('sweater', Colors.blue),
      Product('jeans', Colors.red),
      Product('jacket', Colors.brown),
      Product('scarf', Colors.cyan),
  ];

  @override 
  Widget build(BuildContext context) => GridView.count(
    crossAxisCount: 2,
    children: products.map((product) {
        return ScopedModelDescendant<CartModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => ProductSquare(product, () => model.add(product)));
    }).toList()
    /*children: List.generate(products.length, (index) {
      return ProductSquare(products[index]);
    }),*/
  );
}
