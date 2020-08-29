import 'package:flutter/material.dart';

class TypeRecommend extends StatelessWidget {
  final List list;

  const TypeRecommend({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 2000,
        child: GridView.count(
          crossAxisCount: 2,
          physics: NeverScrollableScrollPhysics(),
          children: list.map((i) => _gridViewItemUI(context, i)).toList(),
        ));
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
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            )));
  }
}
