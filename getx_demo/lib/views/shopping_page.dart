import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/cart_controller.dart';
import 'package:getx_demo/controller/shopping_controller.dart';
import 'package:getx_demo/views/setting_page.dart';

class ShoppingPage extends GetWidget {
  final shoppingCotroller = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('shopping'.tr),
        leading: IconButton(
          onPressed: () {
            Get.to(SettingPage());
          },
          icon: Icon(Icons.settings),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                    itemCount: shoppingCotroller.products.length,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${shoppingCotroller.products[index].name}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                        '${shoppingCotroller.products[index].description}',
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${shoppingCotroller.products[index].price}',
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
                                                shoppingCotroller
                                                    .products[index].id);
                                            Get.snackbar(
                                              'Uhm...',
                                              'Removed ${shoppingCotroller.products[index].name}',
                                              snackPosition: SnackPosition.TOP,
                                              icon: Icon(Icons.alarm),
                                              shouldIconPulse: true,
                                            );
                                          },
                                          child: Text(
                                            'remove'.tr,
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
                                          shoppingCotroller.products[index]);
                                      Get.snackbar(
                                        'Yup!',
                                        'Added ${shoppingCotroller.products[index].name}',
                                        snackPosition: SnackPosition.BOTTOM,
                                        icon: Icon(Icons.add),
                                      );
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(
                                      //   SnackBar(
                                      //     content: Text('ok'),
                                      //   ),
                                      // );
                                    },
                                    child: Text('add'.tr),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Obx(
              () {
                return Text(
                  'total_amount_dollar_amount'.trParams(
                      {'amount': cartController.totalPrice.toString()}),
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
        onPressed: () {
          Get.to(Second());
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return Second();
          //     },
          //   ),
          // );
        },
        label: Obx(
          () {
            return Text(
              '${cartController.count}',
              style: TextStyle(
                color: Colors.black,
              ),
            );
          },
        ),
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
      ),
    );
  }
}

class Second extends GetWidget {
  final CartController ctr = Get.find<CartController>();
  final ShoppingController sctr = Get.find<ShoppingController>();
  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text('Count ${ctr.count} - ${sctr.products.length}'),
            ),
            TextButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'title'.tr,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                  ],
                );
              },
              child: Text('Show dialog'),
            ),
            TextButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.music_note),
                          title: Text('Music'),
                          onTap: () => {},
                        ),
                        ListTile(
                          leading: Icon(Icons.find_in_page),
                          title: Text('Find'),
                          onTap: () => {},
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text('Show bottom sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
