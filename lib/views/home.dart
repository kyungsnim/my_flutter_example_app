import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_example_app/views/regist_profile.dart';
import 'package:my_flutter_example_app/views/use_lottie.dart';
import 'package:my_flutter_example_app/widgets/widgets.dart';

import 'double_tap_zoom.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Kyungsnim\'s Flutter Example'),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DoubleTapZoom()));
              }, child: boxButtonWidget(context, '사진 클릭해서 확대/축소하기')),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistProfile()));
              }, child: boxButtonWidget(context, '프로필 사진 추가하기')),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UseLottie()));
              }, child: boxButtonWidget(context, 'Lottie로 움직이는 이미지 사용')),
            ),

          ],
        )
      )
    );
  }
}
