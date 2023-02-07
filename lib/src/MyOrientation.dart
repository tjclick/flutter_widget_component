import 'package:flutter/material.dart';
import 'package:flutter_tutorial/components/widget_list_repository.dart';
import '../components/widget_list_repository.dart';
import '../components/linkpages/goAppbar.dart';
import '../components/linkpages/goBottomNavigationBar.dart';
import '../components/linkpages/goDrawer.dart';
import '../components/linkpages/goSliverAppBar.dart';
import '../components/linkpages/goTabBar.dart';

class MyOrientation extends StatefulWidget {
  @override
  _MyOrientationState createState() => _MyOrientationState();
}

class _MyOrientationState extends State<MyOrientation> {
  final WidgetListRepository listRepository = WidgetListRepository();

  @override
  void initState() {
    super.initState();
    //현재 지역값 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Components'),
      ),
      body: _bodyWidget(),
    );
  }

  Widget _makeDataList(List<String> datas) {
    int size = datas == null ? 0 : datas.length;
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 5,
          children: List.generate(38, (index) {
            // MAP data mapping
            List<String> data = datas;
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: GestureDetector(
                    onTap: () {
                      //print('test $index');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => _navigationRoute(index)!));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.grey.withOpacity(0.5),
                      child: Text(
                        data[index] as String,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            );
          }),
        );
      },
    );
  }

  // MAP List와 연결 FutureBuilder
  Future<List<String>> _loadContents() async {
    List<String> responseData = await listRepository.loadContentsFromCatagory();
    return responseData;
  }

  // Page body
  Widget _bodyWidget() {
    return FutureBuilder<List<String>>(
      future: _loadContents(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("데이터 오류"));
        }
        if (snapshot.hasData) {
          return _makeDataList(snapshot.data ?? []);
        }
        return Center(child: Text("해당 그룹의 데이터가 없습니다."));
      },
    );
  }
}

Widget? _navigationRoute(int index) {
  if (index == 0) return goAppBar();
  if (index == 1) return goBottomNavigationBar();
  if (index == 2) return goDrawer();
  if (index == 3) return goSliverAppBar();
  if (index == 4) return goTabBar();
}
