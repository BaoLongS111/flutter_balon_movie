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
      height: 890,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(color: Colors.white70, fontSize: 18)),
              Text('更多>', style: TextStyle(color: Colors.grey))
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 830,
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
                      child: Image.network(item.vodPic, fit: BoxFit.fill)),
                ),
                SizedBox(height: 8),
                Text(
                  item.vodName,
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                )
              ],
            )));
  }
}
