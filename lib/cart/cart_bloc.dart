import 'dart:async';
import '../models/index.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final _cart = Cart();

  final _additionController = StreamController<Product>();

  Sink<Product> get addition => _additionController.sink;

  Stream<int> get itemCount => _itemCountSubject.stream;

  final _itemCountSubject = BehaviorSubject<int>();

  CartBloc() {
    _additionController.stream.listen(_handle);
  }

  void _handle(Product product) {
    _cart.add(product);
    _itemCountSubject.add(_cart.itemCount);
  }

}