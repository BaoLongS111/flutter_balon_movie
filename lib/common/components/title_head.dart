import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:flutter/material.dart';

class TitleHead extends StatelessWidget {
  final bool isShowMore;
  final String title;
  const TitleHead({Key key, @required this.title, this.isShowMore = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: ScreenAdaper.setHeight(40),
              margin: EdgeInsets.only(right: ScreenAdaper.setWidth(20)),
              child: Image.asset(
                "assets/images/detail/icon_cnxh.png",
                width: ScreenAdaper.setWidth(48),
                height: ScreenAdaper.setHeight(48),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenAdaper.setSp(56),
              ),
            ),
          ],
        ),
        this.isShowMore
            ? Container(
                padding: EdgeInsets.only(
                  right: ScreenAdaper.setWidth(26),
                ),
                child: Text(
                  '更多>',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenAdaper.setSp(46),
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
