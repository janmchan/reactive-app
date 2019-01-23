import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:reactiveapp/models/index.dart';

import 'product_square.dart';

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
  );
}
