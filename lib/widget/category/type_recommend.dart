import 'package:flutter/material.dart';

class TypeRecommend extends StatefulWidget {
  final List list;

  TypeRecommend({Key key, @required this.list}) : super(key: key);

  @override
  _TypeRecommendState createState() => _TypeRecommendState();
}

class _TypeRecommendState extends State<TypeRecommend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1720,
      padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: GridView.count(
        crossAxisCount: 2,
        physics: NeverScrollableScrollPhysics(),
        children: widget.list.map((i) => _gridViewItemUI(context, i)).toList(),
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
                  aspectRatio: 1.3,
                  child: FadeInImage.assetNetwork(
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
    );
  }
}
