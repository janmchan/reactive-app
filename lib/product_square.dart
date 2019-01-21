import 'package:flutter/material.dart';
import 'package:reactiveapp/models/index.dart';

class ProductSquare extends StatelessWidget{

  final Product product;
  final GestureTapCallback onTap;
  ProductSquare(this.product, this.onTap);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap, 
      child: Column(
        children: <Widget>[_buildBox(context)]
        )
      );
  }
  Widget _buildBox(BuildContext context) {
    const int points = 1;
    final Color color = product.color;
    final textColor = Colors.white;
    return Expanded(
      flex: points,
      child: Container(
        constraints: BoxConstraints.expand(),
        color: color,
        child: Center(
          child: Text(
            product.name,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
