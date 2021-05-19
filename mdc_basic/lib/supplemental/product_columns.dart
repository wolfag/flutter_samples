import 'package:flutter/material.dart';

import 'package:mdc_basic/model/product.dart';
import 'package:mdc_basic/supplemental/product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  final Product bottom;
  final Product top;

  const TwoProductCardColumn({
    Key key,
    @required this.bottom,
    this.top,
  })  : assert(bottom != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spaceHeight = 24.0;
        double heightOfCards = (constraints.biggest.height - spaceHeight) / 2.0;
        double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;
        double imageAspectRatio = heightOfImages > 0.0
            ? constraints.biggest.width / heightOfImages
            : 49.0 / 33.0;

        return ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 28.0),
              child: top != null
                  ? ProductCard(
                      product: top,
                      imageAspectRatio: imageAspectRatio,
                    )
                  : SizedBox(
                      height: heightOfCards,
                    ),
            ),
            SizedBox(
              height: spaceHeight,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 28.0),
              child: ProductCard(
                imageAspectRatio: imageAspectRatio,
                product: bottom,
              ),
            ),
          ],
        );
      },
    );
  }
}

class OneProductCardColumn extends StatelessWidget {
  final Product product;

  const OneProductCardColumn({
    Key key,
    @required this.product,
  })  : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      reverse: true,
      children: [
        SizedBox(
          height: 40.0,
        ),
        ProductCard(
          product: product,
        ),
      ],
    );
  }
}
