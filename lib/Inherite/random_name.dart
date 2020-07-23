import 'package:flutter/material.dart';

import 'name_inherited_widget.dart';

/// 随机展示人名
class RandomName extends StatelessWidget {
  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    final String name =
        (context.dependOnInheritedWidgetOfExactType<NameInheritedWidget>())
            .name;
    final Function changeName =
        (context.dependOnInheritedWidgetOfExactType<NameInheritedWidget>())
            .onNameChange;

    return FlatButton(
      child: Text(name),
      onPressed: () => changeName(),
    );
  }
}
