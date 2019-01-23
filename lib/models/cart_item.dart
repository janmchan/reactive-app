
import 'index.dart';
class CartItem {
    final int count;
    final Product product;
    CartItem(this.count, this.product);

    @override
    String toString() => "${product.name} ✕ $count";
}