import 'package:flutter/material.dart';
import 'package:labo2/components/iconandtextwidget.dart';
import 'package:labo2/components/mybigtext.dart';
import 'package:labo2/components/mycolor.dart';
import 'package:labo2/components/mysmalltext.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;

  @override void initstate(){
    super.initState();
    pageController.addListener(() {
      setState((){_currPageValue= pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : MyColor.mainBlackColor,
              image: DecorationImage(
                  image: AssetImage("lib/images/test1.jpg"),
                  fit: BoxFit.cover)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Container(
              padding:
                  EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyBigText(text: "Venom Clipse"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: MyColor.mainColor,
                                  size: 15,
                                )),
                        //children: List.generate(5, (index) {return Icon(Icons.star, color: MyColor.mainColor,);}), //sama aja, ini cara tanpa pakai Arrow Function (=>)
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MySmallText(text: "4.5"),
                      SizedBox(
                        width: 10,
                      ),
                      MySmallText(text: "1672"),
                      SizedBox(
                        width: 10,
                      ),
                      MySmallText(text: "Comments"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: MyColor.iconColor1),
                      IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7Km",
                          iconColor: MyColor.mainColor),
                      IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: MyColor.iconColor2),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
