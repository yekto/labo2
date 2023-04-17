import 'package:flutter/cupertino.dart';
import 'package:labo2/models/drink.dart';

class BubbleTeaShop extends ChangeNotifier {
  //list of drinks for sale
  final List<Drink> _shop = [
    Drink(
        name: "Ichi Ocha Tea",
        price: "12.000",
        imgs:
            "lib/images/tea.png")
  ];

  //list of drinks in user cart
  final List<Drink> _usercart = [];

  //get drinks for sale
  List<Drink> get shop => _shop;

  //get user chart
  List<Drink> get usercart => _usercart;

  //add drinks to chart
  void addToCart(Drink drink) {
    _usercart.add(drink);
    notifyListeners();
  }

  //remove drinks from chart
  void removeFromCart(Drink drink) {
    _usercart.remove(drink);
    notifyListeners();
  }
}
