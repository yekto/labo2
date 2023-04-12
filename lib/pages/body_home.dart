import 'package:flutter/material.dart';
import 'package:labo2/components/mycolor.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position){
        return _buildPageItem(position);
      }),
    );
  }
  Widget _buildPageItem(int index){
    return Container(
      height: 210,
      margin: EdgeInsets.only(left: 5,right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: index.isEven? Color (0xFF69c5df): MyColor.mainBlackColor,
        image: DecorationImage(image: AssetImage("lib/images/test1.jpg"), fit: BoxFit.cover)
      ),
    );
  }
}
