import 'package:flutter/material.dart';
import 'package:flutter_demo2/home_page.dart';
import 'package:flutter_demo2/test_page_first.dart';
import 'package:flutter_demo2/test_page_second.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ddd',
        home: Scaffold(

          body: TabbarPage(),
        ),
    );
  }
}


