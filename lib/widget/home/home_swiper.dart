import 'package:flutter/material.dart';
import 'package:balon_movie/dao/home_dao.dart';
import 'package:balon_movie/model/home_casual.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatefulWidget {
  HomeSwiper({Key key}) : super(key: key);

  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  List<HomeCasual> casualList = [];

  loadData() {
    HomeDao.getHomeCasual().then((value) {
      setState(() {
        casualList = value;
      });
    }).catchError((e) {
      throw new Exception(e.toString());
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

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
              child: Image.network(
                casualList[index].image,
                fit: BoxFit.fill,
              ),
            );
          },
          itemCount: casualList.length,
          viewportFraction: 0.9,
          scale: 0.95,
          pagination: new SwiperPagination(),
        ));
  }
}
