import 'package:flutter/material.dart';
import 'package:reactiveapp/models/index.dart';
import 'package:reactiveapp/screens/product_home_page.dart';
import 'package:scoped_model/scoped_model.dart';

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