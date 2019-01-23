import 'package:flutter/material.dart';
import 'package:reactiveapp/catalog/catalog_bloc.dart';


/// The equivalent of [CartProvider], but for [CatalogBloc].
class CatalogProvider extends InheritedWidget {
  final CatalogBloc catalogBloc;

  CatalogProvider({
    Key key,
    @required CatalogBloc catalog,
    Widget child,
  })  : assert(catalog != null),
        catalogBloc = catalog,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CatalogBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CatalogProvider) as CatalogProvider)
          .catalogBloc;
}
