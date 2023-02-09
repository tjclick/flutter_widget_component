import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class MyGetWidgetKit extends StatefulWidget {
  const MyGetWidgetKit({super.key});

  @override
  State<MyGetWidgetKit> createState() => _MyGetWidgetKitState();
}

class _MyGetWidgetKitState extends State<MyGetWidgetKit> {
  double _rating = 3;
  bool isChecked = true;
  ScrollController _controller = ScrollController();

  List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    //  theme: ThemeData(
    //      useMaterial3: true, colorSchemeSeed: const Color(0xff6750a4)),
    //  home: Scaffold(
    return Scaffold(
      appBar: AppBar(title: const Text('GetWidget Kit')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                _GetWidgetSearch(),
                _GetWidgetMultiSelect(),
                _GetWidgetCarousel(),
                SizedBox(
                  height: 20,
                ),
                _GetWidgetListTile(),
                SizedBox(
                  height: 20,
                ),
                _GetWidgetToast(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _GetWidgetSearch() {
    return GFSearchBar(
      searchList: list,
      searchQueryBuilder: (query, list) {
        return list
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      overlaySearchListItemBuilder: (item) {
        return Container(
          child: Text(
            item,
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
      onItemSelected: (item) {
        setState(() {
          print('$item');
        });
      },
    );
  }

  // TEST#01 : 여러 이미지 한화면에 가로 슬라이드 ================================================
  Widget _GetWidgetListTile() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        color: Color.fromARGB(255, 210, 230, 240),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.40), blurRadius: 5)
        ],
      ),
      child: Column(
        children: [
          // LISTTILE ------------------------------------------
          GFListTile(
            avatar: GFAvatar(),
            titleText: 'Title',
            subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
            icon: Icon(Icons.face_retouching_off),
          ),
          // BUTTON ------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GFCheckbox(
                size: GFSize.SMALL,
                activeBgColor: GFColors.PRIMARY,
                type: GFCheckboxType.circle,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
                value: isChecked,
              ),
              GFButton(
                onPressed: () {},
                text: "Button 01",
                icon: Icon(Icons.live_tv_sharp),
              ),
              GFButtonBadge(
                onPressed: () {},
                text: "Alert 01",
                icon: GFBadge(
                  child: Text("12"),
                ),
                type: GFButtonType.outline,
                size: GFSize.LARGE,
              ),
            ],
          ),
          // Rating, Toggle button --------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GFRating(
                value: _rating,
                size: GFSize.SMALL,
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
              ),
              GFToggle(
                onChanged: (val) {},
                value: true,
                type: GFToggleType.ios,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GFProgressBar(
            percentage: 0.9,
            backgroundColor: Colors.black26,
            progressBarColor: GFColors.DANGER,
          ),
        ],
      ),
    );
  }

  // TEST#01 : 여러 이미지 한화면에 가로 슬라이드 ================================================
  Widget _GetWidgetCarousel() {
    final List<String> imageList = [
      "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
      "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
      "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
    ];

    return Container(
      child: GFItemsCarousel(
        rowCount: 3,
        children: imageList.map(
          (url) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(url, fit: BoxFit.cover),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  //TOAST ------------------------------------------
  Widget _GetWidgetToast() {
    return GestureDetector(
      onTap: () => GFToast.showToast(
        'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
        context,
        toastPosition: GFToastPosition.BOTTOM,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          color: GFColors.DARK,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.40), blurRadius: 5)
          ],
        ),
        child: GFListTile(
            color: GFColors.DARK,
            title: const Text(
              'Show Toast with toast position',
              style: TextStyle(color: GFColors.WHITE),
            ),
            icon: Icon(
              CupertinoIcons.forward,
              color: GFColors.SUCCESS,
            )),
      ),
    );
  }

  Widget _GetWidgetMultiSelect() {
    return GFMultiSelect(
      items: list,
      onSelect: (value) {
        print('selected $value ');
      },
      dropdownTitleTileText: '',
      dropdownTitleTileMargin:
          EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      dropdownTitleTilePadding: EdgeInsets.all(10),
      dropdownUnderlineBorder:
          const BorderSide(color: Colors.transparent, width: 2),
      dropdownTitleTileBorder: Border.all(color: Colors.grey, width: 1),
      dropdownTitleTileBorderRadius: BorderRadius.circular(5),
      expandedIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black54,
      ),
      collapsedIcon: const Icon(
        Icons.keyboard_arrow_up,
        color: Colors.black54,
      ),
      submitButton: Text('OK'),
      cancelButton: Text('Cancel'),
      dropdownTitleTileTextStyle:
          const TextStyle(fontSize: 14, color: Colors.black54),
      //padding: const EdgeInsets.all(1),
      //margin: const EdgeInsets.all(1),
      type: GFCheckboxType.basic,
      activeBgColor: GFColors.SUCCESS,
      activeBorderColor: GFColors.SUCCESS,
      inactiveBorderColor: Colors.grey,
    );
  }
}
