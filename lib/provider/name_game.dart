import 'package:flutter/material.dart';
import 'package:flutter_app/Inherite/random_name.dart';
import 'package:flutter_app/Inherite/test_other.dart';
import 'package:flutter_app/Inherite/welcome.dart';
import 'package:provider/provider.dart';
import 'name_model.dart';

/// 测试随机名字游戏组件
class NameGame extends StatelessWidget {
  /// 设置状态 name
  final name = NameModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Provider<String>.value(
          child: ChangeNotifierProvider.value(
            value: name,
            child: Column(
              children: <Widget>[
                Welcome(),
                RandomName(),
              ],
            ),
          ),
        ),
        TestOther(),
      ],
    );
  }
}