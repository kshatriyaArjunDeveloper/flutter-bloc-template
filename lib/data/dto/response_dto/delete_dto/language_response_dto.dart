// todo @Project Setup: Delete this
class LanguageResponseDto {
  String id;
  String? englishGreeting;
  String languageType;
  String? langCode;
  String? greeting;
  String? alphabet;

  LanguageResponseDto({
    required this.id,
    required this.languageType,
    this.englishGreeting,
    this.langCode,
    this.greeting,
    this.alphabet,
  });

  factory LanguageResponseDto.fromJson(Map<String, dynamic> json) =>
      LanguageResponseDto(
        id: json["id"],
        englishGreeting: json["englishGreeting"],
        languageType: json["languageType"],
        langCode: json["langCode"],
        greeting: json["greeting"],
        alphabet: json["alphabet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "englishGreeting": englishGreeting,
        "languageType": languageType,
        "langCode": langCode,
        "greeting": greeting,
        "alphabet": alphabet,
      };

  static List<LanguageResponseDto> fromListJson({
    required List<dynamic> listDynamic,
  }) {
    final List<LanguageResponseDto> list = <LanguageResponseDto>[];
    for (final dynamic object in listDynamic) {
      final Map<String, dynamic> map = object as Map<String, dynamic>;
      list.add(LanguageResponseDto.fromJson(map));
    }
    return list;
  }
}
