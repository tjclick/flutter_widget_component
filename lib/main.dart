import 'package:flutter/material.dart';
import 'package:flutter_tutorial/src/MyAnimatedContainer.dart';
import 'package:flutter_tutorial/src/MyAnimatedOpacity.dart';
import 'package:flutter_tutorial/src/MyDrawer.dart';
import 'package:flutter_tutorial/src/MyFormValidation.dart';
import 'package:flutter_tutorial/src/MyOrientation.dart';
import 'package:flutter_tutorial/src/MySnackBar.dart';
import 'package:flutter_tutorial/src/MySwipeToDismiss.dart';
import 'package:flutter_tutorial/src/MyTabController.dart';
import 'package:flutter_tutorial/src/mediaquery.dart';
import 'package:flutter_tutorial/src/my_method_channel.dart';
import 'package:flutter_tutorial/src/stream.dart';
import 'package:flutter/src/widgets/navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Tutorial'),
        ),
        body: Home(),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SecondRoute()));
        }),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Hello World",
      textDirection: TextDirection.ltr,
    ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('AnimatedContainer'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyAnimatedContainer()));
          },
        ),
        ListTile(
          title: Text('AnimatedOpacity'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyAnimatedOpacity()));
          },
        ),
        ListTile(
          title: Text('Drawer'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyDrawer()));
          },
        ),
        ListTile(
          title: Text('SnackBar'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MySnackBar()));
          },
        ),
        ListTile(
          title: Text(
            'Widget Component  > ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyOrientation()));
          },
        ),
        ListTile(
          title: Text('TabController'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyTabController()));
          },
        ),
        ListTile(
          title: Text('FormValidation'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyFormValidation()));
          },
        ),
        ListTile(
          title: Text('Swipe To Dismiss'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MySwipeToDismiss()));
          },
        ),
        ListTile(
          title: Text('MethodChannel'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyMethodChannel()));
          },
        ),
        ListTile(
          title: Text('Stream'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => StreamExam()));
          },
        ),
        ListTile(
          title: Text('MediaQuery'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyMediaQuery()));
          },
        ),
      ],
    );
  }
}
