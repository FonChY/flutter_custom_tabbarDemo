import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

final List<Widget> _tabBodies = [
  HomePage(),
  CategoryPage(),
  ActivityPage(),
  MinePage(),
];

class _TestWidgetState extends State<TestWidget> {
  List images = [
    ['images/home_no.png', 'images/home_pr.png'],
    ['images/tongzhi_no.png', 'images/tongzhi_pr.png'],
    ['images/xueqing_no.png', 'images/xueqing_pr.png'],
    ['images/mine_no.png', 'images/mine_pr.png'],
  ];
  List titles = ['首页', '通知', '学情分析', '我的'];
  int _activeIndex = 0;
  //切换导航
  _switchNav(int newIndex) {
    print(newIndex);

    if (newIndex != _activeIndex) {
      setState(() {
        _activeIndex = newIndex;
      });
    }
  }

  Widget _item(index) {
    return Container(
      width: ScreenUtil().setWidth(750 / 4),

      color: Colors.white, //可以去掉inkwell的水波效果
      child: InkWell(
        onTap: () {
          _switchNav(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Offstage(
                    offstage: false,
                    child: Image.asset(
                      images[index][0],
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Offstage(
                    offstage: _activeIndex == index ? false : true,
                    child: Image.asset(
                      images[index][1],
                      // fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Text(
                titles[index],
                style: TextStyle(
                  fontSize: 12,
                    color: _activeIndex == index
                        ? Colors.blueAccent
                        : Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('自定义tabbar'),
        ),
        body: Container(
            // height: ScreenUtil().setHeight(98),
            child: Stack(
              children: <Widget>[
                _tabBodies[_activeIndex],
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: ScreenUtil().setHeight(98),

                      child: Row(
                        children: <Widget>[
                          _item(0),
                          _item(1),
                          _item(2),
                          _item(3),
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('首页'),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('通知'),
      ),
    );
  }
}

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('学情分析'),
      ),
    );
  }
}

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('我的'),
      ),
    );
  }
}
