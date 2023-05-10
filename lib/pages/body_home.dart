import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:labo2/widget/iconandtextwidget.dart';
import 'package:labo2/widget/mybigtext.dart';
import 'package:labo2/widget/mycolor.dart';
import 'package:labo2/widget/mysmalltext.dart';

class BodyHome extends StatefulWidget {
  BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  final PageController pageController = PageController(initialPage: 0,viewportFraction: 0.85);//
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;

  @override
  void initstate() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue =  pageController.page!  ;
        print(_currPageValue.toString());
      });
    });
  }

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 3,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          // position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        Text("Ini page"+pageController.toString()),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);

      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    }

    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              // color: index.isEven ? Color(0xFF69c5df) : MyColor.mainBlackColor,
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
              padding: EdgeInsets.only(top: 15, left: 15, right: 30),
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
                        // children: List.generate(5, (index) {return Icon(Icons.star, color: MyColor.mainColor,size: 15,);}), //sama aja, ini cara tanpa pakai Arrow Function (=>)
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
