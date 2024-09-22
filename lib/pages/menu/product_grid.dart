import 'package:flutter/material.dart';
import 'product.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          imageUrl: products[index].imageUrl,
          productName: products[index].name,
          calories: products[index].calories,
          price: products[index].price,
        );
      },
    );
  }
}
