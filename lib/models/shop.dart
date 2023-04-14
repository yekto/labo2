import 'package:labo2/models/drink.dart';

class BubbleTeaShop {
  //list of drinks for sale
  final List<Drink> _shop =[
    Drink(name: "Mix bubble", price: "12.000", img: "https://cdn.shopify.com/s/files/1/0610/0402/1985/products/Monsoon_1200x.png?v=1638596400")
  ];

  //list of drinks in user cart
  final List<Drink> _usercart = [];

  //get drinks for sale
  List<Drink> get shop => _shop;

  //get user chart
  List<Drink> get usercart => _usercart;

  //add drinks to chart
  void addToCart(Drink drink){
    _usercart.add(drink);
  }

  //remove drinks from chart
  void removeToCart(Drink drink){
    _usercart.remove(drink);
  }
}