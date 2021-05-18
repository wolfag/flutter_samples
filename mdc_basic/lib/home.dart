import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdc_basic/model/product.dart';
import 'package:mdc_basic/model/product_repository.dart';
import 'package:mdc_basic/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products.isEmpty) {
      return const [];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.button,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    formatter.format(product.price),
                    style: theme.textTheme.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shrine'),
        brightness: Brightness.dark,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(Category.all),
      ),
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   padding: const EdgeInsets.all(16.0),
      //   childAspectRatio: 8.0 / 9.0,
      //   children: _buildGridCards(context),
      // ),
      resizeToAvoidBottomInset: false,
    );
  }
}
