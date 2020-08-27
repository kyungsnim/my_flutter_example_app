import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_example_app/constants/constants.dart';
import 'package:my_flutter_example_app/widgets/widgets.dart';
import 'package:vector_math/vector_math_64.dart';

class DoubleTapZoom extends StatefulWidget {
  const DoubleTapZoom({
    Key key,
  }) : super(key: key);

  @override
  _DoubleTapZoomState createState() => _DoubleTapZoomState();
}

class _DoubleTapZoomState extends State<DoubleTapZoom> with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animation = Tween(begin: 1.0, end: 2.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))..addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Tap Zoom'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('1111', style: TextStyle(fontSize: 20)),
            Text('2222', style: TextStyle(fontSize: 20)),
            Text('3333', style: TextStyle(fontSize: 20)),
            Text('4444', style: TextStyle(fontSize: 20)),
            Text('5555', style: TextStyle(fontSize: 20)),
            GestureDetector(
              onTap: () {
                if(_animationController.isCompleted) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              },
              child: Container(
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.diagonal3(Vector3(_animation.value, _animation.value, _animation.value)),
                    child: CachedNetworkImage(
                      imageUrl: 'https://images.unsplash.com/photo-1598294203238-ed1ac7484b8b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=676&q=80',
                      fit: BoxFit.fill
                    )
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
            Text('6666', style: TextStyle(fontSize: 20)),
            Text('7777', style: TextStyle(fontSize: 20)),
            Text('8888', style: TextStyle(fontSize: 20)),
          ],
        ),
      )
    );
  }
}