import 'dart:async';
import '../models/index.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final _cart = Cart();

  final _additionController = StreamController<Product>();

  Sink<Product> get addition => _additionController.sink;

  ValueObservable<int> get itemCount => _itemCountSubject.stream;

  final _itemCountSubject = BehaviorSubject<int>();

}