class FamousRestaurantResponse {
  final FamousRestaurantHeader header;
  final List<FamousRestaurant> items;
  final int numOfRows;
  final int pageNo;
  final int totalCount;

  FamousRestaurantResponse({
    required this.header,
    required this.items,
    required this.numOfRows,
    required this.pageNo,
    required this.totalCount,
  });

  factory FamousRestaurantResponse.fromJson(Map<String, dynamic> json) {
    final dataKey = json.keys.firstWhere(
          (key) => key.startsWith('getFood'),
      orElse: () => throw Exception('No valid data key found'),
    );

    final data = json[dataKey];
    if (data == null) {
      throw Exception('Invalid response format: data is null');
    }

    return FamousRestaurantResponse(
      header: FamousRestaurantHeader.fromJson(data['header']),
      items: (data['item'] as List?)
          ?.map((item) => FamousRestaurant.fromJson(item))
          .toList() ?? [],
      numOfRows: data['numOfRows'] ?? 0,
      pageNo: data['pageNo'] ?? 1,
      totalCount: data['totalCount'] ?? 0,
    );
  }
}

// 헤더 정보를 담는 모델
class FamousRestaurantHeader {
  final String code;
  final String message;

  FamousRestaurantHeader({
    required this.code,
    required this.message,
  });

  factory FamousRestaurantHeader.fromJson(Map<String, dynamic> json) {
    return FamousRestaurantHeader(
      code: json['code'],
      message: json['message'],
    );
  }
}

// 맛집 정보를 담는 모델
class FamousRestaurant {
  final int ucSeq;
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
    required this.ucSeq,
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
      ucSeq: json['UC_SEQ'],
      mainTitle: json['MAIN_TITLE'],
      gugunNm: json['GUGUN_NM'],
      lat: json['LAT'].toDouble(),
      lng: json['LNG'].toDouble(),
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

enum LanguageType {
  korean('kr', 'getFoodKr'),
  english('en', 'getFoodEn');

  final String code;
  final String responseKey;

  const LanguageType(this.code, this.responseKey);
}