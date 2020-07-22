import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart'; // 需要在pubspec.yaml增加该模块

class HomePage extends StatefulWidget {
  /// 当前时间显示的前缀信息
  final String prefix = '当前时间';

  @override
  createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  /// 展示当前时间字符串
  String currentTimeStr;

  @override
  void initState() {
    super.initState();
    this.currentTimeStr = getCurrentTime();
    refreshTimeStr();
  }

  /// 更新当前时间字符串 [currentTimeStr]
  ///
  /// 每 500ms 更新一次，使用 Timer
  void refreshTimeStr() {
    const period = Duration(milliseconds: 500);
    // 定时更新当前时间的 currentTimeStr 字符串
    Timer.periodic(period, (timer) {
      setState(() {
        this.currentTimeStr = getCurrentTime();
      });
    });
  }

  String getCurrentTime() {
    DateTime dateTime = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    String time = formatter.format(dateTime);
    return '$time';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Text(widget.prefix), Text(this.currentTimeStr)],
    );
  }
}
