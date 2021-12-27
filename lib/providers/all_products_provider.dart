import 'dart:math';
import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/product.dart';

class Products extends ChangeNotifier {
  List<Product> _allproducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'assets/images/gambar.jpeg',
      );
    },
  );

  List<Product> get allproducts {
    return [..._allproducts];
  }
  
  Product findById(productId) {
    return _allproducts.firstWhere((prodId) => prodId.id == productId);
  }
}