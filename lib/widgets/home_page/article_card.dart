import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/struct/article_summary_struct.dart';
import 'package:flutter_app/struct/user_info_struct.dart';

import 'article_bottom_bar.dart';
import 'article_like_bar.dart';
import 'article_summary.dart';

/// 此为帖子描述类，包括了帖子UI中的所有元素
class ArticleCard extends StatelessWidget {
  /// 传入的用户信息
  final UserInfoStruct userInfo;

  /// 传入的帖子信息
  final ArticleSummaryStruct articleInfo;

  /// 构造函数
  const ArticleCard({Key key, this.userInfo, this.articleInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ArticleSummary(
            title: articleInfo.title,
            summary: articleInfo.summary,
            articleImage: articleInfo.articleImage),
        Row(children: <Widget>[
          ArticleBottomBar(
              nickname: userInfo.nickname,
              headerImage: userInfo.headerImage,
              commentNum: articleInfo.commentNum),
          Padding(padding: EdgeInsets.only(left: 50),),
          ArticleLikeBar(likeNum: articleInfo.likeNum)
        ])
      ],
    );
  }
}
