import 'package:flutter/cupertino.dart';
import 'package:latihan_provider/models/cart_item.dart';

class Cart extends ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get jumlah => _items.length;

  void addCart(String productId, String title, double price) {
    // ketika sudah tersedia key product id, lalu ingin menambahkan (update) product lagi ke dalam cart
    if (_items.containsKey(productId)) {
      _items.update(
        productId, 
        (value) => CartItem(
          id: value.id, 
          title: value.title, 
          price: value.price, 
          quantity: value.quantity
        ),
      );
      // baru menambahkan product id
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: 1,
            quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
