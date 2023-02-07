import 'package:flutter/material.dart';

class MyMediaQuery extends StatefulWidget {
  @override
  _MyMediaQueryState createState() => _MyMediaQueryState();
}

class _MyMediaQueryState extends State<MyMediaQuery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MediaQuery'),
      ),
      body: Center(
        child: CustomText(
          '글자 테스트',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

class CustomText extends Text {
  CustomText(
    String data, {
    Key? key,
    style,
    strutStyle,
    textAlign,
    textDirection,
    locale,
    softWrap,
    overflow,
    maxLines,
    semanticsLabel,
  }) : super(data,
            key: key,
            style: style,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textScaleFactor: 1.0);
}
