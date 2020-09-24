import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:flutter/material.dart';

class DetailTag extends StatelessWidget {
  final List tags;
  final int tagNum;
  const DetailTag({Key key, @required this.tags, this.tagNum = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tagNum != 0 && tags.length > 4) {
      tags.removeRange(4, tags.length);
    }
    return tags.length > 0
        ? Padding(
            padding: EdgeInsets.only(
              left: tagNum == 0 ? ScreenAdaper.setWidth(40) : 0,
              right: tagNum == 0 ? ScreenAdaper.setWidth(20) : 0,
            ),
            child: Wrap(
              spacing: ScreenAdaper.setWidth(tagNum == 0 ? 16 : 50),
              runSpacing: ScreenAdaper.setHeight(tagNum == 0 ? 12 : 20),
              children: tags.map((i) => _itemUI(i)).toList(),
            ),
          )
        : SizedBox();
  }

  Widget _itemUI(String title) {
    return Container(
      height: ScreenAdaper.setHeight(60),
      width: ScreenAdaper.setWidth(150),
      padding: EdgeInsets.fromLTRB(
        ScreenAdaper.setWidth(6),
        ScreenAdaper.setHeight(10),
        ScreenAdaper.setWidth(6),
        ScreenAdaper.setHeight(10),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ScreenAdaper.setHeight(60),
          ),
          color: Colors.purpleAccent),
      child: Text(
        title,
        softWrap: true,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white70,
          fontSize: ScreenAdaper.setSp(28),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
