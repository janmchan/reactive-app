import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final int count;
  CartButton(this.count);
  @override 
  Widget build(BuildContext context) {
    return RaisedButton(
                        onPressed: () {},
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Icon(Icons.shopping_cart),
                            new Text(count.toString())
                          ],
                        ),
                      );
  }
}