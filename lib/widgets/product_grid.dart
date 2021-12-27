import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/all_products_provider.dart';
import 'package:provider/provider.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<Products>(context);
    final allproduct = productData.allproducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allproduct.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: allproduct[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}