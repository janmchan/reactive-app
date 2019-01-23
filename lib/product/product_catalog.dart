import 'package:flutter/material.dart';
import 'package:reactiveapp/cart/cart_bloc.dart';
import 'package:reactiveapp/cart/cart_provider.dart';
import 'package:reactiveapp/catalog/catalog_bloc.dart';
import 'package:reactiveapp/product_square.dart';
import '../shared/cart_button.dart';
import '../shared/theme.dart';
import '../services/catalog.dart';
import '../bloc/bloc_cart_page.dart';


class ReactiveApp extends StatelessWidget {
  final CatalogBloc catalog;
  final CartBloc cart;

  ReactiveApp(this.catalog, this.cart);

  @override 
  Widget build(BuildContext context){
    return CatalogProvider(
      catalog: catalog,
      child: CartProvider(
      cartBloc: CartBloc(),
      child: MaterialApp(
        title: 'Bloc',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: ProductHomePage(),
        routes: <String, WidgetBuilder> {
          BlocCartPage.routeName: (context) => BlocCartPage()
        } )

    ));
  }
}

class ProductHomePage extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    final cartBlocInstance = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
        actions: <Widget>[
          StreamBuilder<int>(
            stream: cartBlocInstance.itemCount,
            initialData: 0,
            builder: (context, snapshot) =>  CartButton(
            itemCount: snapshot.data
            ))
        ],
      ),
      body: ProductCatalog(),
    );
  }
}

class ProductCatalog extends StatelessWidget{

  @override 
  Widget build(BuildContext context) { 
    final cartBlocInstance = CartProvider.of(context);
    return  GridView.count(
      crossAxisCount: 2,
      children: catalog.products.map((product) {
        return ProductSquare(product, () {
          cartBlocInstance.addition.add(product);
        });
    }).toList()
    /*children: List.generate(products.length, (index) {
      return ProductSquare(products[index]);
    }),*/
  );
  }
}
