import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/provider/video_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget({Key key}) : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  bool isDz = false;
  bool isCai = false;
  bool isSc = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdaper.setHeight(220),
      child: Consumer<VideoProvider>(builder: (context, videoProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  icon: isDz
                      ? Image.asset(
                          "assets/images/detail/icon_dz_1.png",
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          "assets/images/detail/icon_dz.png",
                          fit: BoxFit.fill,
                        ),
                  onPressed: () {
                    setState(() {
                      isDz = !isDz;
                      isDz
                          ? videoProvider.homeModel.vodUp += 1
                          : videoProvider.homeModel.vodUp -= 1;
                    });
                  },
                ),
                Text(
                  videoProvider.homeModel.vodUp.toString(),
                  style: TextStyle(
                      fontSize: ScreenAdaper.setSp(40), color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: isCai
                      ? Image.asset(
                          "assets/images/detail/icon_cai_1.png",
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          "assets/images/detail/icon_cai.png",
                          fit: BoxFit.fill,
                        ),
                  onPressed: () {
                    setState(() {
                      isCai = !isCai;
                      isCai
                          ? videoProvider.homeModel.vodDown += 1
                          : videoProvider.homeModel.vodDown -= 1;
                    });
                  },
                ),
                Text(
                  videoProvider.homeModel.vodDown.toString(),
                  style: TextStyle(
                      fontSize: ScreenAdaper.setSp(40), color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: isSc
                      ? Image.asset(
                          "assets/images/detail/icon_sc_1.png",
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          "assets/images/detail/icon_sc.png",
                          fit: BoxFit.fill,
                        ),
                  onPressed: () {
                    setState(() {
                      isSc = !isSc;
                    });
                  },
                ),
                Text(
                  "收藏",
                  style: TextStyle(
                      fontSize: ScreenAdaper.setSp(40), color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/images/detail/icon_xz.png",
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {},
                ),
                Text(
                  "下载",
                  style: TextStyle(
                      fontSize: ScreenAdaper.setSp(40), color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/images/detail/icon_fx.png",
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {},
                ),
                Text(
                  "分享",
                  style: TextStyle(
                      fontSize: ScreenAdaper.setSp(40), color: Colors.white),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
