import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../shared/cart_page.dart';

class BlocCartPage extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: StreamBuilder<List<CartItem>>(
          stream: null,
          initialData: const [],
          builder: (context, snapshot) => _buildBody(context, snapshot.data)),
    );
  }

  Widget _buildBody(BuildContext context, List<CartItem> items) {
    if (items.isEmpty) {
      return Center(
          child: Text('Empty cart',
              style: Theme.of(context).textTheme.display1));
    }

    final itemTiles =
        items.map((item) => ItemTile(item: item)).toList(growable: false);
    return ListView(children: itemTiles);
  }
}