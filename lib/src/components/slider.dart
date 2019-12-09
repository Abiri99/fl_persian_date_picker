import 'package:flutter/material.dart';

class slider extends StatefulWidget {
  final PageView child;

  slider({this.child});

  @override
  _sliderState createState() => _sliderState();
}

class _sliderState extends State<slider> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        height: 36,
        width: double.infinity,
        // color: Colors.red,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              size: 14,
              color: Colors.white38,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              alignment: Alignment.center,
              child: widget.child,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.white38,
            ),
          ],
        ));
  }
}
