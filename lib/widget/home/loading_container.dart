import 'package:flutter/material.dart';

//加载进度条组件
class LoadingContainer extends StatelessWidget {
  final Widget child; //当页面加载好后显示的内容
  final bool isLoading; //是否正在加载
  final bool cover; //是否要覆盖布局

  const LoadingContainer(
      {Key key,
      @required this.child,
      @required this.isLoading,
      this.cover = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover
        ? !isLoading ? child : _loadingView
        : Stack(
            children: <Widget>[child, isLoading ? _loadingView : null],
          );
  }

  Widget get _loadingView {
    return Center(child: CircularProgressIndicator());
  }
}
