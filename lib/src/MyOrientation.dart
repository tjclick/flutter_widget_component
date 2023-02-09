import 'package:flutter/material.dart';
import '../components/widget_list_repository.dart';
//--------------------------------------------------------------
import '../components/linkpages/goAppbar.dart';
import '../components/linkpages/goBottomNavigationBar.dart';
import '../components/linkpages/goDrawer.dart';
import '../components/linkpages/goSliverAppBar.dart';
import '../components/linkpages/goTabBar.dart';
import '../components/linkpages/goTabBarView.dart';
import '../components/linkpages/goTabController.dart';
import '../components/linkpages/goDropdownButton.dart';
import '../components/linkpages/goElevatedButton.dart';
import '../components/linkpages/goFloatingActionButton.dart';
//--------------------------------------------------------------
import '../components/linkpages/goIconButton.dart';
import '../components/linkpages/goOutlinedButton.dart';
import '../components/linkpages/goPopupMenuButton.dart';
import '../components/linkpages/goTextButton.dart';
import '../components/linkpages/goCheckbox.dart';
import '../components/linkpages/goDateTimePickers.dart';
import '../components/linkpages/goRadio.dart';
import '../components/linkpages/goSlider.dart';
import '../components/linkpages/goSwitch.dart';
import '../components/linkpages/goTextField.dart';
//--------------------------------------------------------------
import '../components/linkpages/goAlertDialog.dart';
import '../components/linkpages/goBottomSheet.dart';
import '../components/linkpages/goExpansionPanel.dart';
import '../components/linkpages/goSimpleDialog.dart';
import '../components/linkpages/goSnackBar.dart';
import '../components/linkpages/goCard.dart';
import '../components/linkpages/goChip.dart';
import '../components/linkpages/goCircularProgressIndicator.dart';
import '../components/linkpages/goDataTable.dart';
import '../components/linkpages/goGridView.dart';
//--------------------------------------------------------------
import '../components/linkpages/goCustomScroll.dart';
//import '../components/linkpages/goImage.dart';
import '../components/linkpages/goLinearProgressIndicator.dart';
import '../components/linkpages/goTooltip.dart';
import '../components/linkpages/goDivider.dart';
import '../components/linkpages/goListTile.dart';
import '../components/linkpages/goStepper.dart';

class MyOrientation extends StatefulWidget {
  @override
  _MyOrientationState createState() => _MyOrientationState();
}

class _MyOrientationState extends State<MyOrientation> {
  final WidgetListRepository listRepository = WidgetListRepository();
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    //현재 지역값 초기화
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            useMaterial3: true, colorSchemeSeed: const Color(0xff6750a4)),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Widget Components'),
          ),
          body: _bodyWidget(),
        ));
  }

  Widget _makeDataList(List<String> datas) {
    int size = datas == null ? 0 : datas.length;
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14));

    return CustomScrollView(controller: _controller, slivers: [
      SliverList(
        delegate: SliverChildListDelegate([]),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          delegate: SliverChildListDelegate(
            List.generate(35, (index) {
              List<String> data = datas;
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        color: Colors.grey,
                        height: 80,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => 
                                        _navigationRoute(index)!));
                          },
                          child: Text(data[index] as String),
                        ),
                      ),
                    ),
                    Text("Document", style: TextStyle(fontSize: 14)),
                    Text("DartPad Demo",
                        style: TextStyle(
                          fontSize: 14,
                        )),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ]);
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
  if (index == 1) return goAlertDialog();
  if (index == 2) return goBottomNavigationBar();
  if (index == 3) return goBottomSheet();
  if (index == 4) return goCheckbox();
  if (index == 5) return goCard();
  if (index == 6) return goChip();
  if (index == 7) return goCircularProgressIndicator();
  if (index == 8) return goDropdownButton();
  if (index == 9) return goDrawer();
  if (index == 10) return goDataTable();
  if (index == 11) return goDateTimePickers();
  if (index == 12) return goDivider();
  if (index == 13) return goElevatedButton();
  if (index == 14) return goExpansionPanel();
  if (index == 15) return goFloatingActionButton();
  if (index == 16) return goGridView();
  if (index == 17) return goIconButton();
  if (index == 18) return goListTile();
  if (index == 19) return goLinearProgressIndicator();
  if (index == 20) return goOutlinedButton();
  if (index == 21) return goPopupMenuButton();
  if (index == 22) return goRadio();
  if (index == 23) return goSliverAppBar();
  if (index == 24) return goSlider();
  if (index == 25) return goSwitch();
  if (index == 26) return goSimpleDialog();
  if (index == 27) return goSnackBar();
  if (index == 28) return goStepper();
  if (index == 29) return goTextField();
  if (index == 30) return goTextButton();
  if (index == 31) return goTabBar();
  if (index == 32) return goTabBarView();
  if (index == 33) return goTabController();
  if (index == 34) return goTooltip();
}
