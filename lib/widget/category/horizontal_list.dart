import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HorizontalList extends StatefulWidget {
  int _currentIndex = 0;
  List list = [];
  HorizontalList({Key key, @required this.list}) : super(key: key);

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
