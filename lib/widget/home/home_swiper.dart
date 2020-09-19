import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/model/home_casual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatelessWidget {
  //ScrollNotificationInterceptor
  final List<HomeCasual> casualList;
  const HomeSwiper({Key key, @required this.casualList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdaper.setWidth(500),
      padding: EdgeInsets.fromLTRB(0, ScreenAdaper.setHeight(20), 0, 0),
      child: ScrollNotificationInterceptor(
        //easyRefresh 用来阻止滑动冲突的组件
        child: Swiper(
          autoplay: true,
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/no_banner.png",
                  fadeInDuration: const Duration(milliseconds: 300),
                  fadeOutDuration: const Duration(milliseconds: 100),
                  image: casualList[index].image,
                  fit: BoxFit.fill),
            );
          },
          itemCount: casualList.length,
          viewportFraction: 0.9,
          scale: 0.95,
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  size: 5, //点点没选中时候的大小
                  activeSize: 8, //点点选中后的大小
                  color: Colors.grey, //点点的颜色
                  activeColor: Colors.white),
              alignment: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
