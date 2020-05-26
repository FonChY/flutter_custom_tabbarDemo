import 'package:flutter/material.dart';

class TabbarPage extends StatefulWidget {
  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  PageController _pageController;

  List images = [
    ['images/home_no.png', 'images/home_pr.png'],
    ['images/tongzhi_no.png', 'images/tongzhi_pr.png'],
    ['images/xueqing_no.png', 'images/xueqing_pr.png'],
    ['images/mine_no.png', 'images/mine_pr.png'],
  ];

  final List _titles = ['首页', '通知', '学情分析', '我的'];

  final List<Widget> _tabBodies = [
    HomePage(),
    CategoryPage(),
    ActivityPage(),
    MinePage(),
  ];

  int _currentIndex = 0;

  void initState() {
    super.initState();
    this._pageController =
        PageController(initialPage: _currentIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          physics: NeverScrollableScrollPhysics(),

        children: _tabBodies,
        controller: _pageController,
      ),
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  BottomAppBar _bottomAppBar() {
    double width = MediaQuery.of(context).size.width;
    double height = 60;

    return BottomAppBar(
      child: Container(
        //设置背景
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     repeat: ImageRepeat.noRepeat,
        //     image: AssetImage('images/shengyukeshibg.png'),
        //   ),
        // ),
        width: width,
        height: height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _customItems(),
        ),
      ),
    );
  }

  /*获取tab图片*/
  Widget getTabIcon(int index) {
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: false,
          child: Image.asset(
            images[index][0],
            width: 30,
            height: 30,
          ),
        ),
        Offstage(
          offstage: _currentIndex == index ? false : true,
          child: Image.asset(
            images[index][1],
            width: 30,
            height: 30,
          ),
        ),
      ],
    );
    // if (_currentIndex == index) {
    //   return Image.asset(
    //     images[index][1],
    //     width: 30,
    //     height: 30,
    //     fit: BoxFit.fitHeight,
    //   );
    // }
    // return Image.asset(images[index][0], width: 30,height: 30, fit: BoxFit.fitHeight);
  }

/*获取tab文字*/
  Text getTabText(int index) {
    if (_currentIndex == index) {
      return Text(
        _titles[index],
        style: TextStyle(color: Colors.blue, fontSize: 14),
      );
    }

    return Text(
      _titles[index],
      style: TextStyle(color: Colors.black, fontSize: 14),
    );
  }

  List<Widget> _customItems() {
    double width = MediaQuery.of(context).size.width;
    //均分成4分
    double itemWidth = width / 4.0;
    return images.map((img) {
      int index = images.indexOf(img);
      return GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        child: Container(
          color: Colors.transparent,
          width: itemWidth * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              getTabIcon(index),
              getTabText(index),
            ],
          ),
        ),
      );
    }).toList();
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
