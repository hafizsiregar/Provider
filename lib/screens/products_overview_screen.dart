import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/cart.dart';
import 'package:latihan_provider/screens/cart_screen.dart';
import 'package:latihan_provider/widgets/badge.dart';
import 'package:latihan_provider/widgets/product_grid.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) {
              return Badge(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        CartScreen.routeName,
                      );
                    },
                  ),
                  value: value.jumlah.toString(),
                  color: Colors.amber);
            },
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}