class HomeRecommendModel {
  final int vodID;
  final String vodName;
  final String vodEn;
  final String vodLetter;
  final String vodTag;
  final String vodClass;
  final String vodPic;
  final int vodHits;
  final int hitsWeek;
  final int hitsMonth;
  int vodUp;
  int vodDown;
  final int vodScore;
  final int vodScoreAll;
  final int vodScoreNum;
  final int vodTime;
  final int vodTimeAdd;
  final String vodPlayUrl;

  HomeRecommendModel(
      {this.vodID,
      this.vodName,
      this.vodEn,
      this.vodLetter,
      this.vodTag,
      this.vodClass,
      this.vodPic,
      this.vodHits,
      this.hitsWeek,
      this.hitsMonth,
      this.vodUp,
      this.vodDown,
      this.vodScore,
      this.vodScoreAll,
      this.vodScoreNum,
      this.vodTime,
      this.vodTimeAdd,
      this.vodPlayUrl});

  factory HomeRecommendModel.fromJson(Map<String, dynamic> json) {
    return HomeRecommendModel(
      vodID: json['vod_id'],
      vodName: json['vod_name'],
      vodEn: json['vod_en'],
      vodLetter: json['vod_letter'],
      vodTag: json['vod_tag'],
      vodClass: json['vod_class'],
      vodPic: json['vod_pic'],
      vodHits: json['vod_hits'],
      hitsWeek: json['hits_week'],
      hitsMonth: json['hits_month'],
      vodUp: json['vod_up'],
      vodDown: json['vod_down'],
      vodScore: json['vod_score'],
      vodScoreAll: json['vod_score_all'],
      vodScoreNum: json['vod_score_num'],
      vodTime: json['vod_time'],
      vodTimeAdd: json['vod_time_add'],
      vodPlayUrl: json['vod_play_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vod_id'] = this.vodID;
    data['vod_name'] = this.vodName;
    data['vod_en'] = this.vodEn;
    data['vod_letter'] = this.vodLetter;
    data['vod_tag'] = this.vodTag;
    data['vod_class'] = this.vodClass;
    data['vod_pic'] = this.vodPic;
    data['vod_hits'] = this.vodHits;
    data['hits_week'] = this.hitsWeek;
    data['hits_month'] = this.hitsMonth;
    data['vod_up'] = this.vodUp;
    data['vod_down'] = this.vodDown;
    data['vod_score'] = this.vodScore;
    data['vod_score_all'] = this.vodScoreAll;
    data['vod_score_num'] = this.vodScoreNum;
    data['vod_time'] = this.vodTime;
    data['vod_time_add'] = this.vodTimeAdd;
    data['vod_play_url'] = this.vodPlayUrl;
    return data;
  }
}
