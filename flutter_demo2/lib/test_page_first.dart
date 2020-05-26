
import 'package:flutter/material.dart';
import 'package:flutter_demo2/test_page_second.dart';


class FYHTabbar extends StatefulWidget {
  @override
  FYHTabbarState createState() => FYHTabbarState();
}

// class CustomerNotification extends Notification {
//   CustomerNotification(this.enable);
//   final bool enable;
// }

class FYHTabbarState extends State<FYHTabbar>
     {
  List<Widget> pages = List<Widget>();

  // bool sendeEnable = false;
  TopBarPage _sendHomePage = TopBarPage();

  int _activeIndex = 0; //激活项
  double _height = 49.0; //导航栏高度
 

  List _navs = [
    ['images/home_no.png', 'images/home_pr.png'],
    ['images/tongzhi_no.png', 'images/tongzhi_pr.png'],
    ['images/xueqing_no.png', 'images/xueqing_pr.png'],
  ]; //导航项

  @override
  void initState() {
    super.initState();
    pages..add(AudioBook())..add(_sendHomePage)..add(Team());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;

    return   Container(
          child: Stack(children: [
            pages[_activeIndex],//tabbar要存放的页面
            Positioned(//用Positioned绝对定位悬浮的TabBar
              bottom: 0,
              child: Container(
                // padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                width: width,
                
                child: Stack(
                  // overflow: Overflow.visible,
                  children: <Widget>[
                    //所有图标
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFFf2f4f5), // 底色
                        shape: BoxShape.rectangle, // 默认值也是矩形
                         
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffc1c1c1),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 50.0,
                              spreadRadius: 2.0)
                        ],
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: _navs
                              .asMap()
                              .map((i, v) => MapEntry(
                                  i,
                                  GestureDetector(
                                    child: Column(
                                     children: <Widget>[
                                        Container(
                                      color: Color(0xFFf2f4f5),
                                      margin: EdgeInsets.all(0),
                                      child: Image.asset(v[_activeIndex==i?1:0]),
                                      width: width / 3 - 30,
                                      height: _height - 20,
                                    ),
                                    Container(
                                      height: 20,
                                      child: Text('data'),
                                    ),
                                     ],
                                    ),
                                    onTap: () {
                                      _switchNav(i);
                                    },
                                  )))
                              .values
                              .toList(),
                        ),
                    ),
                    //浮动图标
                     
                  ],
                ),
              ),
            )
          ]),
    );
         
     
  }
 
  //切换导航
  _switchNav(int newIndex) {
    print(newIndex);
    double oldPosition = _activeIndex.toDouble();
    double newPosition = newIndex.toDouble();
    if (oldPosition != newPosition) {
      setState(() {
        _activeIndex = newIndex;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class TopBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:  Text('data'),), 
    );
  }
}

class AudioBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('data'),), 
    );
  }
}

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('data'),), 
    );
  }
}

class Fair extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('data'),), 
    );
  }
}

class Mine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('data'),), 
    );
  }
}
