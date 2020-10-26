import 'package:balon_movie/common/components/icon_text.dart';
import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:flutter/material.dart' hide Router;

class SearchTag extends StatelessWidget {
  const SearchTag({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdaper.setWidth(1080),
      padding: EdgeInsets.all(
        ScreenAdaper.setWidth(20),
      ),
      color: Colors.black87,
      child: Column(
        children: [
          _historySearch(),
          SizedBox(
            height: ScreenAdaper.setHeight(20),
          ),
          _hotSearch(),
        ],
      ),
    );
  }

  Widget _historySearch() {
    final List<String> tags = [
      '强奸',
      '乱伦',
      '制服诱惑',
      '母子奸',
      '偷情',
      '强奸',
      '偷情',
      '强奸',
    ];
    return tags.length > 0
        ? Padding(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "历史搜索",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: ScreenAdaper.setSp(40),
                      ),
                    ),
                    IconText(
                      "清空",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenAdaper.setSp(38),
                      ),
                      direction: Axis.horizontal,
                      icon: Icon(
                        Icons.account_box,
                        color: Colors.pink,
                      ),
                      iconSize: ScreenAdaper.setSp(44),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenAdaper.setWidth(20),
                    right: ScreenAdaper.setWidth(20),
                    top: ScreenAdaper.setWidth(28),
                    bottom: ScreenAdaper.setWidth(28),
                  ),
                  child: Wrap(
                    spacing: ScreenAdaper.setWidth(20),
                    runSpacing: ScreenAdaper.setHeight(20),
                    children: tags.map((i) => _itemUI(i)).toList(),
                  ),
                ),
              ],
            ),
          )
        : SizedBox();
  }

  Widget _hotSearch() {
    final List<String> tags = [
      '强奸',
      '乱伦',
      '制服诱惑',
      '母子奸',
      '偷情',
      '强奸',
      '强奸',
      '乱伦',
      '制服诱惑',
      '母子奸',
      '偷情',
      '强奸',
    ];
    return tags.length > 0
        ? Padding(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "热门搜索",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: ScreenAdaper.setSp(40),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenAdaper.setWidth(20),
                    right: ScreenAdaper.setWidth(20),
                    top: ScreenAdaper.setWidth(28),
                    bottom: ScreenAdaper.setWidth(28),
                  ),
                  child: Wrap(
                    spacing: ScreenAdaper.setWidth(20),
                    runSpacing: ScreenAdaper.setHeight(20),
                    children: tags.map((i) => _itemUI(i)).toList(),
                  ),
                ),
              ],
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
