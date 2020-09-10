import 'package:balon_movie/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HorizontalList extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String type_text;
  int _currentIndex = 0;
  List list = [];
  HorizontalList({
    Key key,
    @required this.list,
    // ignore: non_constant_identifier_names
    @required this.type_text,
  }) : super(key: key);

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.fromLTRB(8, 6, 8, 6),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.list.length,
        itemBuilder: (context, index) =>
            _itemUI(context, widget.list[index], index),
      ),
    );
  }

  Widget _itemUI(BuildContext context, String text, int index) {
    Color _defaultColor = Colors.transparent;
    Color _activeColor = Colors.purpleAccent;

    return GestureDetector(
      onTap: () {
        switch (widget.type_text) {
          case "类型":
            if (text.contains("全部"))
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .type = "*";
            else
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .type = text;
            break;
          case "地区":
            if (text.contains("全部"))
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .area = "*";
            else
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .area = text;
            break;
          case "清晰度":
            if (text.contains("全部"))
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .hd = "*";
            else
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .hd = text;
            break;
          case "长度":
            if (text.contains("全部"))
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .size = "*";
            else
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .size = text;
            break;
          case "有码":
            if (text.contains("全部"))
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .ma = "*";
            else
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .ma = text;
            break;
          case "语言":
            if (text.contains("全部"))
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .language = "*";
            else
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .language = text;
            break;
          case "排序":
            if (text.contains("综合"))
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .paixu = "*";
            else
              Provider.of<CategoryProvider>(context, listen: false)
                  .categoryModel
                  .paixu = text;
            break;
        }
        Provider.of<CategoryProvider>(context, listen: false)
            .categoryModel
            .toZi();
        setState(() {
          widget._currentIndex = index;
        });
      },
      child: Container(
        height: 30,
        width: 80,
        padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:
                widget._currentIndex == index ? _activeColor : _defaultColor),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
