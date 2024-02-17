import 'package:ecommerce_shop/shoes.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Shoes> cart = [];

  void addProduct(Shoes product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(Shoes product) {
    cart.remove(product);
    notifyListeners();
  }

  void removeAllProduct() {
    cart = [];
    notifyListeners();
  }
}
