import 'package:get/get.dart';
import 'package:getx_demo/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var response = [
      Product(
        id: 1,
        price: 30,
        description: 'some des about product',
        name: 'abc',
        image: 'mm',
      ),
      Product(
        id: 2,
        price: 30,
        description: 'some des about product',
        name: 'abc',
        image: 'mm',
      ),
      Product(
        id: 3,
        price: 30,
        description: 'some des about product',
        name: 'abc',
        image: 'mm',
      ),
      Product(
        id: 4,
        price: 30,
        description: 'some des about product',
        name: 'abc',
        image: 'mm',
      ),
      Product(
        id: 5,
        price: 30,
        description: 'some des about product',
        name: 'abc',
        image: 'mm',
      ),
      Product(
        id: 6,
        price: 30,
        description: 'some des about product',
        name: 'abc',
        image: 'mm',
      ),
      Product(
        id: 7,
        price: 30,
        description: 'some des about product',
        name: 'abc',
        image: 'mm',
      ),
    ];

    products.value = response;
  }
}
