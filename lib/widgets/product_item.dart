import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/cart.dart';
import 'package:latihan_provider/providers/product.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProduct = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: dataProduct.id,
            );
          },
          child: Image.asset(
            dataProduct.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: (dataProduct.isFavorite)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border_outlined),
              color: Theme.of(context).accentColor,
              onPressed: () {
                dataProduct.statusFavorite();
              },
            ),
          ),
          title: Text(
            dataProduct.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Berhasil di tambahkan ke Keranjang'),
                duration: Duration(milliseconds: 1000),
              ));
              cart.addCart(
                  dataProduct.id, dataProduct.title, dataProduct.price);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
