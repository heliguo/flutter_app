import 'package:flutter/material.dart';
import 'package:flutter_app/utils/fade_in_image_without_auth.dart';

/// banner 展示组件
///
/// 只需要传入需要展示的[bannerImage]
class BannerInfo extends StatelessWidget {
  /// 帖子标题
  final String bannerImage;

  /// 构造函数
  const BannerInfo({Key key, this.bannerImage}) : super(key: key);

  /// 左侧的标题和标题描述组件
  Widget getLeftInfo() {
    return Row(
      children: <Widget>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
//        Image.network(
//          bannerImage,
//          width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.height / 2,
//          fit: BoxFit.cover,
//        ),
        new FadeInImageWithoutAuth.assetNetwork(
          placeholder: 'assets/flower.jpg',
          image: bannerImage,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        )
//        FadeInImageWithoutAuth.assetNetwork(
//          placeholder: bannerImage,
//          image:bannerImage,
//          fit: BoxFit.fill,
//        )
      ],
    );
  }
}
