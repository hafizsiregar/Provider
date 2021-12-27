import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/all_products_provider.dart';
import 'package:latihan_provider/providers/cart.dart';
import 'package:latihan_provider/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!

    final product = Provider.of<Products>(context).findById(productId);

    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
         actions: [
          Badge(
              child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      CartScreen.routeName,
                    );
                  }),
              value: "0",
              color: Colors.amber)
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Image.asset(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'IDN adalah suatu yayasan yang berdiri salah satunya di Jonggol'),
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Add to chart',
              style: TextStyle(fontSize: 20),),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Berhasil di tambahkan ke Keranjang'),
                duration: Duration(milliseconds: 1000),
              ));
              cart.addCart(
                  product.id, product.title, product.price);
              },
            ),
          ],
        ),
      ),
    );
  }
}
