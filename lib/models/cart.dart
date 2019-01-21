import 'index.dart';
class Cart {
  List<CartItem> items = [];
  int get itemCount => items.length;
  void add(Product product) {
    items.add(product);
  }
}