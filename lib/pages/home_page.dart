import 'package:flutter/cupertino.dart';
import 'package:flutter_app/struct/article_summary_struct.dart';
import 'package:flutter_app/struct/user_info_struct.dart';
import 'package:flutter_app/widgets/common/banner_info.dart';
import 'package:flutter_app/widgets/home_page/article_card.dart';

class HomePage extends StatelessWidget {
  /// banner 地址信息 加载HTTP图片没问题
  final String bannerImage = 'http://192.168.20.133:8866/app/pic.jpg';

  /// 帖子标题 使用asset本地图片没问题
  final UserInfoStruct userInfo = UserInfoStruct('flutter', '');

  /// 帖子概要描述信息
  final ArticleSummaryStruct articleInfo = ArticleSummaryStruct(
      '你好，交个朋友',
      '我是一个小可爱',
      'https://img.089t.com/content/20200227/osbbw9upeelfqnxnwt0glcht.jpg',
      20,
      30);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          BannerInfo(bannerImage: bannerImage),
          ArticleCard(
            userInfo: userInfo,
            articleInfo: articleInfo,
          ),
        ],
      ),
    );
  }
}
