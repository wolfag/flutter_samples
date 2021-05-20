import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_demo/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _items = <Product>[].obs;

  int get count => _items.length;

  List<Product> get items => _items;

  double get totalPrice =>
      _items.fold(0, (previousValue, element) => previousValue + element.price);

  addToCart(Product product) {
    _items.add(product);
  }

  removeFromCart(int id) {
    _items.removeWhere((element) => element.id == id);
  }
}
