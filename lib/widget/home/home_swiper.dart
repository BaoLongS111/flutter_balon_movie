import 'package:flutter/material.dart';
import 'package:balon_movie/model/home_casual.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatelessWidget {
  const HomeSwiper({Key key, @required this.casualList}) : super(key: key);

  final List<HomeCasual> casualList;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: new Swiper(
          autoplay: true,
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            return new ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/no_banner.png",
                  image: casualList[index].image,
                  fit: BoxFit.fill),
            );
          },
          itemCount: casualList.length,
          viewportFraction: 0.9,
          scale: 0.95,
          pagination: new SwiperPagination(),
        ));
  }
}
