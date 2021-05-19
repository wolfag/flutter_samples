import 'package:flutter/material.dart';
import 'package:mdc_basic/model/product.dart';
import 'package:mdc_basic/model/product_repository.dart';
import 'package:mdc_basic/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({
    Key key,
    this.category = Category.all,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(category),
      ),
    );
  }
}
