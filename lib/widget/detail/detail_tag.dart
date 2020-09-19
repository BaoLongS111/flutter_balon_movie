import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:flutter/material.dart';

class DetailTag extends StatelessWidget {
  final List tags;
  const DetailTag({Key key, @required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tags.length > 0
        ? Container(
            padding: EdgeInsets.only(
              left: ScreenAdaper.setWidth(20),
              right: ScreenAdaper.setWidth(20),
            ),
            height: ScreenAdaper.setHeight(130),
            child: Wrap(
              spacing: ScreenAdaper.setWidth(16),
              runSpacing: ScreenAdaper.setHeight(12),
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
        ScreenAdaper.setWidth(14),
        ScreenAdaper.setWidth(6),
        ScreenAdaper.setWidth(14),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ScreenAdaper.setHeight(60),
          ),
          color: Colors.purpleAccent),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white70,
          fontSize: ScreenAdaper.setSp(32),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
