import 'package:flutter/material.dart';
import 'package:labo2/models/shop.dart';
import 'package:provider/provider.dart';
import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  OrderPage({Key? key, required this.drink}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sweetValue = 0.5;
  double iceValue = 0.5;
  double pearlValue = 0.5;

  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  void addToCart() {
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully add to cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name)),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          //img
          Image.asset(widget.drink.imgs.toString()),

          //slider
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: Text("Sweet"),
                      width: 100,
                    ),
                    Expanded(
                      child: Slider(
                          value: sweetValue,
                          label: sweetValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizeSweet(value)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: Text("Ice"),
                      width: 100,
                    ),
                    Expanded(
                      child: Slider(
                          value: iceValue,
                          label: iceValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizeIce(value)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: Text("Pearl"),
                      width: 100,
                    ),
                    Expanded(
                      child: Slider(
                          value: pearlValue,
                          label: pearlValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizePearl(value)),
                    )
                  ],
                ),
                MaterialButton(
                  onPressed: addToCart,
                  child: Text(
                    "Add to chart",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
