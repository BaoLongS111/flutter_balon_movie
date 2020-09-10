import 'package:balon_movie/common/loading_indicator.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:flutter/material.dart';

class TypeRecommend extends StatelessWidget {
  final List list;
  const TypeRecommend({Key key, @required this.list}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return list.length != 0
  //       ? Container(
  //           height: 800,
  //           padding: EdgeInsets.fromLTRB(3, 5, 3, 5),
  //           child: GridView.count(
  //             physics: NeverScrollableScrollPhysics(),
  //             crossAxisCount: 2,
  //             children: list.map((i) => _girdItemUI(i)).toList(),
  //           ),
  //         )
  //       : Center(
  //           child: BallPulseSyncIndicator(
  //             ballColor: Colors.purpleAccent,
  //           ),
  //         );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(3, 5, 3, 5),
      child: _warpList(),
    );
  }

  Widget _girdItemUI(HomeRecommendModel item) {
    return InkWell(
      onTap: () {},
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
                    child: FadeInImage.assetNetwork(
                        key: UniqueKey(),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/images/no_banner.png");
                        },
                        placeholder: "assets/images/global/outline.png",
                        fadeInDuration: const Duration(milliseconds: 300),
                        fadeOutDuration: const Duration(milliseconds: 100),
                        image: item.vodPic,
                        fit: BoxFit.fill)),
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
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _warpList() {
    if (list.length != 0) {
      List<Widget> listWidget = list.map((item) {
        return InkWell(
          onTap: () {},
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
                        child: FadeInImage.assetNetwork(
                            key: UniqueKey(),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset("assets/images/no_banner.png");
                            },
                            placeholder: "assets/images/global/outline.png",
                            fadeInDuration: const Duration(milliseconds: 300),
                            fadeOutDuration: const Duration(milliseconds: 100),
                            image: item.vodPic,
                            fit: BoxFit.fill)),
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
                        fontWeight: FontWeight.bold),
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
