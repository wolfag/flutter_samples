import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/cart_controller.dart';
import 'package:getx_demo/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingCotroller = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (_shopController) => ListView.builder(
                  itemCount: _shopController.products.length,
                  itemBuilder: (context, index) {
                    bool isContain = true;
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${_shopController.products[index].name}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      '${_shopController.products[index].description}',
                                    )
                                  ],
                                ),
                                Text(
                                  '${_shopController.products[index].price}',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            ButtonBar(
                              children: [
                                isContain
                                    ? ElevatedButton(
                                        onPressed: () {
                                          cartController.removeFromCart(
                                              _shopController
                                                  .products[index].id);
                                        },
                                        child: Text(
                                          'Remove',
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Colors.red,
                                          ),
                                        ),
                                      )
                                    : Container(),
                                ElevatedButton(
                                  onPressed: () {
                                    cartController.addToCart(
                                        _shopController.products[index]);
                                  },
                                  child: Text('Add'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text(
                  'Total amount: \$${controller.totalPrice}',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(
            '${controller.count}',
            style: TextStyle(
              color: Colors.black,
            ),
          );
        }),
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
