import 'package:flutter/material.dart';
/// 创建有状态测试组件
class TestStatefulWidget extends StatefulWidget {
  @override
  createState() {
    print('create state');
    return TestState();
  }
}
/// 创建状态管理类，继承状态测试组件
class TestState extends State<TestStatefulWidget> {
  /// 定义 state [count] 计算器
  int count = 1;
  /// 定义 state [name] 为当前描述字符串
  String name = 'test';
  @override
  initState() {
    print('init state');
    super.initState();
  }
  @override
  didChangeDependencies() {
    print('did change dependencies');
    super.didChangeDependencies();
  }
  @override
  didUpdateWidget(TestStatefulWidget oldWidget) {
    count++;
    print('did update widget');
    super.didUpdateWidget(oldWidget);
  }
  @override
  deactivate() {
    print('deactivate');
    super.deactivate();
  }
  @override
  dispose() {
    print('dispose');
    super.dispose();
  }
  @override
  reassemble(){
    print('reassemble');
    super.reassemble();
  }
  /// 修改 state name
  void changeName() {
    setState(() {
      print('set state');
      this.name = 'flutter';
    });
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('$name $count'), // 使用 Text 组件显示描述字符和当前计算
          onPressed:()=> this.changeName(), // 点击触发修改描述字符 state name
        ),
        SubStatefulWidget() // 加载子组件
      ],
    );
  }
}

/// 创建子组件类
class SubStatefulWidget extends StatefulWidget {
  @override
  createState() {
    print('sub create state');
    return SubState();
  }
}
/// 创建子组件状态管理类
class SubState extends State<SubStatefulWidget> {
  String name = 'sub test';
  @override
  initState() {
    print('sub init state');
    super.initState();
  }
  @override
  didChangeDependencies() {
    print('sub did change dependencies');
    super.didChangeDependencies();
  }
  @override
  didUpdateWidget(SubStatefulWidget oldWidget) {
    print('sub did update widget');
    super.didUpdateWidget(oldWidget);
  }
  @override
  deactivate() {
    print('sub deactivate');
    super.deactivate();
  }
  @override
  dispose() {
    print('sub dispose');
    super.dispose();
  }
  @override
  reassemble(){
    print('sub reassemble');
    super.reassemble();
  }
  @override
  Widget build(BuildContext context) {
    print('sub build');
    return Text('subname $name'); // 使用Text组件显示当前name state
  }
}

