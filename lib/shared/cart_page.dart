import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../models/cart_item.dart';

class CartPage extends StatelessWidget {
  CartPage(this.cart);
  final Cart cart;

  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Text('Empty', style: Theme.of(context).textTheme.display1))
          : ListView(
              children:
                  cart.items.map((item) => ItemTile(item: item)).toList()),
    );
  }
}

class ItemTile extends StatelessWidget {
  ItemTile({this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: isDark(item.product.color) ? Colors.white : Colors.black);

    return Container(
      color: item.product.color,
      child: ListTile(
        title: Text(
          item.product.name,
          style: textStyle,
        ),
        trailing: CircleAvatar(
            backgroundColor: const Color(0x33FFFFFF),
            child: Text(item.count.toString(), style: textStyle)),
      ),
    );
  }

  bool isDark(Color color) {
    final luminence =
        (0.2126 * color.red + 0.7152 * color.green + 0.0722 * color.blue);
    return luminence < 150;
  }
}

