import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';


void main() {
  ///主界面
  runApp(MyApp());

//  print('flow start');
//  Timer.run(() {
//    /// 执行事件任务，打印标记
//    print('event');
//  });
//  scheduleMicrotask(() {
//    /// 执行微任务，打印标记
//    print('microtask');
//  });
//  /// 打印结束标记
//  print('flow end');
  /**执行顺序
   *  flow start
      flow end
      microtask
      event
   */
//  isolateServer();
}

Isolate isolate;
String name = 'dart';

/// 多线程函数
void isolateServer() async {
  /// 创建新的线程，并且执行回调 changName 
  final receive = ReceivePort();
  isolate = await Isolate.spawn(changName, receive.sendPort);

  /// 监听线程返回信息 
  receive.listen((data) {
    /// 打印线程返回的数据
    print("Myname is $data");

    /// 打印全局 name 的数据
    print("Myname is $name");
  });
}

/// 线程回调处理函数
void changName(SendPort port) {

  /// 修改当前全局 name 属性，但不会影响name的真正value 内存隔离
  name = 'dart isloate';

  /// /// 将当前name发送给监听方
  port.send(name);

  /// 打印当前线程中的 name
  print("Myname is $name in isloate");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    /**
     * 无状态widget StatelessWidget
     * return Container(
        //⽩⾊背景
        color: Colors.blue,
        //Dart语法中，?? 表示如果text为空，就返回尾号后的内容。
        child: Text(_string ?? "这就是⽆状态DMEO"),
        );
     */
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: HomePage()
        ));
  }
}
