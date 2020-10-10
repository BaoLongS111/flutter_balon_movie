import 'package:balon_movie/common/utils/date_format.dart';
import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/provider/video_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailTitle extends StatelessWidget {
  const DetailTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<VideoProvider>(builder: (context, videoProvider, child) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                ScreenAdaper.setWidth(40),
                0,
                ScreenAdaper.setWidth(40),
                ScreenAdaper.setHeight(24),
              ),
              child: Text(
                videoProvider.homeModel.vodName,
                textDirection: TextDirection.ltr,
                softWrap: true,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenAdaper.setSp(46),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                ScreenAdaper.setWidth(15),
                ScreenAdaper.setWidth(15),
                0,
                ScreenAdaper.setWidth(20),
              ),
              padding: EdgeInsets.only(
                left: ScreenAdaper.setWidth(30),
              ),
              height: ScreenAdaper.setHeight(50),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/detail/icon_pf.png",
                    height: ScreenAdaper.setWidth(38),
                    width: ScreenAdaper.setWidth(38),
                  ),
                  SizedBox(
                    width: ScreenAdaper.setWidth(5),
                  ),
                  Text(
                    videoProvider.homeModel.vodScore.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenAdaper.setSp(35),
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: ScreenAdaper.setWidth(20),
                  ),
                  Image.asset(
                    "assets/images/detail/icon_gxsj.png",
                    height: ScreenAdaper.setWidth(38),
                    width: ScreenAdaper.setWidth(38),
                  ),
                  SizedBox(
                    width: ScreenAdaper.setWidth(10),
                  ),
                  Text(
                    DateUtils.instance.getFormartData(
                        timeSamp: videoProvider.homeModel.vodTimeAdd,
                        format: "yyyy-MM-dd"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenAdaper.setSp(35),
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: ScreenAdaper.setWidth(20),
                  ),
                  Image.asset(
                    "assets/images/detail/icon_play_num.png",
                    height: ScreenAdaper.setWidth(38),
                    width: ScreenAdaper.setWidth(38),
                  ),
                  SizedBox(
                    width: ScreenAdaper.setWidth(10),
                  ),
                  Text(
                    videoProvider.homeModel.vodHits.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenAdaper.setSp(35),
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
