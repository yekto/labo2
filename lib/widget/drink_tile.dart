import 'package:flutter/material.dart';

import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  void Function()? onTap;
  final Drink drink;
  final Widget trailing;
  DrinkTile({Key? key,required this.drink,required this.onTap,required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imgs,),
          trailing: trailing,
        ),
      ),
    );
  }
}
