import 'package:flutter/material.dart';
import 'package:mdc_basic/model/product.dart';
import 'package:mdc_basic/supplemental/product_columns.dart';

class AsymmetricView extends StatelessWidget {
  final List<Product> products;

  const AsymmetricView({
    Key key,
    @required this.products,
  })  : assert(products != null),
        super(key: key);

  List<Container> _buildColumns(BuildContext context) {
    if (products.isEmpty) {
      return [];
    }
    return List.generate(_listItemCount(products.length), (index) {
      double widthh = 0.59 * MediaQuery.of(context).size.width;
      Widget column;
      if (index % 2 == 0) {
        int bottom = _evenCasesIndex(index);
        column = TwoProductCardColumn(
          bottom: products[bottom],
          top: products.length - 1 >= bottom + 1 ? products[bottom + 1] : null,
        );
        widthh += 32.0;
      } else {
        column = OneProductCardColumn(product: products[_oddCasesIndex(index)]);
      }

      return Container(
        width: widthh,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: column,
        ),
      );
    });
  }

  int _evenCasesIndex(int input) {
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    if (totalItems % 3 == 0) {
      return totalItems ~/ 3 * 2;
    } else {
      return (totalItems / 3).ceil() * 2 - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
      children: _buildColumns(context),
    );
  }
}
