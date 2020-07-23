import 'package:flutter/material.dart';

/// 帖子下面的信息栏
///
/// 包括用户头像、昵称和评论信息，但不包括点赞，因为点赞为动态组件
/// 需要参数[nickname]、[headerImage]、[commentNum]
class ArticleBottomBar extends StatelessWidget {
  /// 用户昵称
  final String nickname;

  /// 用户头像
  final String headerImage;

  /// 评论数量
  final int commentNum;

  /// 构造函数
  const ArticleBottomBar(
      {Key key, this.nickname, this.headerImage, this.commentNum})
      : super(key: key);

  /// 帖子栏中的用户头像和昵称信息
  Widget getUserWidget() {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 10)),
        new Image.asset("assets/flower.jpg",
            width: 15, height: 15, fit: BoxFit.cover),
        Padding(padding: EdgeInsets.only(right: 10)),
        Text(nickname)
      ],
    );
  }

  /// 帖子栏中的评论信息
  Widget getCommentWidget() {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 100)),
        Icon(Icons.comment, color: Colors.grey, size: 18),
        Padding(padding: EdgeInsets.only(left: 10)),
        Text('$commentNum'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[getUserWidget(), getCommentWidget()],
    );
  }
}
