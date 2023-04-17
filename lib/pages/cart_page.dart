import 'package:flutter/material.dart';
import 'package:labo2/models/shop.dart';
import 'package:labo2/widget/drink_tile.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text("Your Chart"),
              const SizedBox(height:10 ,),

              //listcart
              Expanded(
                child: ListView.builder(
                  itemCount: value.usercart.length,
                  itemBuilder: (context, index) {
                    Drink drink = value.usercart[index];
                    return DrinkTile(
                      drink: drink,
                      onTap: () => removeFromCart(drink),
                      trailing: Icon(Icons.delete),
                    );
                  },
                ),
              ),

              //pay
              MaterialButton(
                onPressed: () {},
                color: Colors.grey,
                child: Text(
                  "PAY",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
