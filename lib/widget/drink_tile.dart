import 'package:flutter/material.dart';

import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  const DrinkTile({Key? key,required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(drink.name),
        subtitle: Text(drink.price),
        leading: Image.asset("lib/images/tea.png",),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
