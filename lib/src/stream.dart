import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class StreamExam extends StatefulWidget {
  @override
  _StreamExamState createState() => _StreamExamState();
}

class _StreamExamState extends State<StreamExam> {
  final subject = BehaviorSubject<int>();

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: subject.stream,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text('add'),
                    onPressed: () {
                      subject.add(++count);
                    },
                  ),
                  Text('${snapshot.data}'),
                ],
              );
            } else {
              return Text('no data');
            }
          },
        ),
      ),
    );
  }
}
