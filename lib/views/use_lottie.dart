import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_flutter_example_app/widgets/widgets.dart';

class UseLottie extends StatefulWidget {
  @override
  _UseLottieState createState() => _UseLottieState();
}

class _UseLottieState extends State<UseLottie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Lottie image'),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          // Load a Lottie file from your assets
          Lottie.asset('assets/LottieLogo1.json'),

          // Load a Lottie file from a remote url
          Lottie.network(
              'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),

          // Load an animation and its images from a zip file
          Lottie.asset('assets/lottiefiles/angel.zip'),
        ],
      )
    );
  }
}
