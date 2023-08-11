class Districts {
  int id;
  int province_id;
  String en_name;
  String np_name;

  Districts({
    required this.id,
    required this.province_id,
    required this.en_name,
    required this.np_name,
  });

  factory Districts.fromJson(Map<String, dynamic> json) {
    return Districts(
      id: json['id'],
      province_id: json['province_id'],
      en_name: json['en_name'],
      np_name: json['np_name'],
    );
  }
}
