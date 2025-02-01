enum CategoryType {
  medicalInstitution('부산광역시 수영구 의료기관 현황'),
  famousRestaurant('부산광역시 맛집정보 서비스'),
  exma1('예시1'),
  exma2('예시2'),
  exma3('예시3'),
  exma4('예시4');

  final String title;

  const CategoryType(this.title);
}

final Category = CategoryType.values;