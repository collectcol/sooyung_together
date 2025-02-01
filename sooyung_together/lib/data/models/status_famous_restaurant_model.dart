class FamousRestaurant {
  final String resultMsg;
  final int totalCount;
  final String mainTitle;
  final String gugunNm;
  final double lat;
  final double lng;
  final String place;
  final String title;
  final String subtitle;
  final String addr1;
  final String addr2;
  final String contactTel;
  final String homepageUrl;
  final String usageDayWeekAndTime;
  final String representativeMenu;
  final String mainImgNormal;
  final String mainImgThumb;
  final String itemContents;

  FamousRestaurant({
    required this.resultMsg,
    required this.totalCount,
    required this.mainTitle,
    required this.gugunNm,
    required this.lat,
    required this.lng,
    required this.place,
    required this.title,
    required this.subtitle,
    required this.addr1,
    required this.addr2,
    required this.contactTel,
    required this.homepageUrl,
    required this.usageDayWeekAndTime,
    required this.representativeMenu,
    required this.mainImgNormal,
    required this.mainImgThumb,
    required this.itemContents,
  });

  factory FamousRestaurant.fromJson(Map<String, dynamic> json) {
    return FamousRestaurant(
      resultMsg: json['resultMSG'],
      totalCount: json['totalCount'],
      mainTitle: json['MAIN_TITLE'],
      gugunNm: json['GUGUN_NM'],
      lat: json['LAT'],
      lng: json['LNG'],
      place: json['PLACE'],
      title: json['TITLE'],
      subtitle: json['SUBTITLE'],
      addr1: json['ADDR1'],
      addr2: json['ADDR2'],
      contactTel: json['CNTCT_TEL'],
      homepageUrl: json['HOMEPAGE_URL'],
      usageDayWeekAndTime: json['USAGE_DAY_WEEK_AND_TIME'],
      representativeMenu: json['RPRSNTV_MENU'],
      mainImgNormal: json['MAIN_IMG_NORMAL'],
      mainImgThumb: json['MAIN_IMG_THUMB'],
      itemContents: json['ITEMCNTNTS'],
    );
  }
}

enum PerPageFamousRestaurant {
  ten,
  twenty,
  thirty,
  fifty;

  int get valueToNumber {
    switch (this) {
      case PerPageFamousRestaurant.ten:
        return 10;
      case PerPageFamousRestaurant.twenty:
        return 20;
      case PerPageFamousRestaurant.thirty:
        return 30;
      case PerPageFamousRestaurant.fifty:
        return 50;
    }
  }
}