import 'dart:convert';

import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:balon_movie/provider/video_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routers/application.dart';

class HomeRecommend extends StatelessWidget {
  final List list;
  final String title;
  final bool isShowTitle;

  const HomeRecommend(
      {Key key, @required this.list, this.title, this.isShowTitle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                    ScreenAdaper.setWidth(14),
                    0,
                    ScreenAdaper.setWidth(14),
                    0,
                  ),
                  height: ScreenAdaper.setHeight(45),
                  width: ScreenAdaper.setWidth(16),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    gradient: LinearGradient(
                      // 线性渐变，如果没有指定开始和结束的地方，则默认从左边到右边
                      colors: [Color(0xffCB356B), Color(0xffCB356B)],
                      begin: Alignment.topCenter, // 开始
                      end: Alignment.bottomCenter, // 结束
                    ),
                    borderRadius: BorderRadius.circular(
                      ScreenAdaper.setHeight(10),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenAdaper.setSp(48),
                  ),
                ),
              ],
            ),
            Text(
              '更多>',
              style: TextStyle(
                color: Colors.grey,
                fontSize: ScreenAdaper.setSp(40),
              ),
            )
          ],
        ),
        Container(
          height: ScreenAdaper.setWidth(1600),
          margin: EdgeInsets.fromLTRB(
            0,
            ScreenAdaper.setHeight(24),
            0,
            ScreenAdaper.setHeight(40),
          ),
          child: GridView.count(
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            children: list.map((i) => _gridViewItemUI(context, i)).toList(),
          ),
        )
      ],
    );
  }

  Widget _gridViewItemUI(BuildContext context, HomeRecommendModel item) {
    return GestureDetector(
      onTap: () {
        Provider.of<VideoProvider>(context, listen: false).updateModel(item);
        Application.router.navigateTo(
          context,
          "/detail",
          transition: TransitionType.fadeIn,
        );
        // Navigator.push(
        //   context,
        //   new MaterialPageRoute(
        //     builder: (context) => DetailPage(model: item),
        //   ),
        // );
      },
      child: Container(
        height: ScreenAdaper.setHeight(300),
        width: ScreenAdaper.setWidth(500),
        margin: EdgeInsets.fromLTRB(
          ScreenAdaper.setWidth(12),
          0,
          ScreenAdaper.setWidth(12),
          ScreenAdaper.setHeight(38),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: ScreenAdaper.setHeight(300),
                width: ScreenAdaper.setWidth(500),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(ScreenAdaper.setHeight(15)),
                  child: AspectRatio(
                    aspectRatio: 1.3,
                    child: CachedNetworkImage(
                      imageUrl: item.vodPic,
                      placeholder: (context, url) => Image.asset(
                          "assets/images/global/outline.png",
                          fit: BoxFit.fill),
                      errorWidget: (context, url, error) => Image.asset(
                          "assets/images/no_banner.png",
                          fit: BoxFit.fill),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: ScreenAdaper.setHeight(10)),
            Text(
              item.vodName,
              softWrap: true,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.ltr,
              maxLines: 1,
              style: TextStyle(
                  fontSize: ScreenAdaper.setSp(34),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
