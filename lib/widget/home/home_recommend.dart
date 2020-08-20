import 'package:flutter/material.dart';

class HomeRecommend extends StatelessWidget {
  final List list;
  final String title;

  const HomeRecommend({Key key, @required this.list, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 560,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 8, 5, 5),
                    height: 18,
                    width: 5,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        gradient: LinearGradient(
                          // 线性渐变，如果没有指定开始和结束的地方，则默认从左边到右边
                          colors: [Color(0xffCB356B), Color(0xffCB356B)],
                          begin: Alignment.topCenter, // 开始
                          end: Alignment.bottomCenter, // 结束
                        ),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  Text(title,
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
              Text('更多>', style: TextStyle(color: Colors.grey))
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 480,
            child: GridView.count(
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              children: list.map((i) => _gridViewItemUI(context, i)).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _gridViewItemUI(BuildContext context, item) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: AspectRatio(
                      aspectRatio: 1.48,
                      child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/no_banner.png",
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
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                )
              ],
            )));
  }
}
