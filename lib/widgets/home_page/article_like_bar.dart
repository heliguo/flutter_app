import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleLikeBar extends StatefulWidget {
  ///外部传参
  final int likeNum;

  ///构造函数
  const ArticleLikeBar({Key key, this.likeNum}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ArticleLikeBarState();
  }
}

class ArticleLikeBarState extends State<ArticleLikeBar> {
  /// 帖子d文章的赞组件的状态管理类
  ///
  /// 内部包括组件的点赞效果，点击后触发数字更新操作
  /// [likeNum] 为状态组件可变数据

  int likeNum;

  @override
  void initState() {
    super.initState();
    likeNum ??= widget.likeNum;
  }

  ///动态修改
  void like() {
    setState(() {
      likeNum = ++likeNum;
    });
  }

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.thumb_up,
          color: Colors.grey,
          size: 18,
        ),
        FlatButton(child: Text('$likeNum'), onPressed: like)
      ],
    );
  }
}
