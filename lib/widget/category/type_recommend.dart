import 'package:balon_movie/common/loading/loading_indicator.dart';
import 'package:balon_movie/provider/video_provider.dart';
import 'package:balon_movie/routers/application.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///搜索页和类型页的UI
class TypeRecommend extends StatelessWidget {
  final List list;
  const TypeRecommend({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(3, 5, 3, 5),
      child: _warpList(context),
    );
  }

  Widget _warpList(BuildContext context) {
    if (list.length != 0) {
      List<Widget> listWidget = list.map((item) {
        return GestureDetector(
          onTap: () {
            Provider.of<VideoProvider>(context, listen: false)
                .updateModel(item);
            Application.router.navigateTo(
              context,
              "/detail",
              transition: TransitionType.fadeIn,
            );
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 8),
            child: Container(
              width: 162,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
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
                  SizedBox(height: 8),
                  Text(
                    item.vodName,
                    softWrap: true,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Center(
        child: BallPulseSyncIndicator(
          ballColor: Colors.purpleAccent,
        ),
      );
    }
  }
}
