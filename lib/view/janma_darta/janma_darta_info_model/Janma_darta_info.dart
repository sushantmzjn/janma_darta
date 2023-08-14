class JanmaInfo {
  final String title;

  JanmaInfo({required this.title});

  factory JanmaInfo.fromJson(Map<String, dynamic> json) {
    return JanmaInfo(title: json['title']);
  }
}

List<JanmaInfo> info = [
  JanmaInfo(title: 'सम्बन्धित वोडाको सिफारिस'),
  JanmaInfo(title: 'dfaddfa'),
  JanmaInfo(title: 'asdfd'),
  JanmaInfo(title: 'adfa'),
  JanmaInfo(title: 'adfa'),
  JanmaInfo(title: 'adfa'),
  JanmaInfo(title: 'adfa'),
  JanmaInfo(title: 'adfa'),
  JanmaInfo(title: 'adfa'),
  JanmaInfo(title: 'adfa'),
  JanmaInfo(title: 'adfa'),
  JanmaInfo(title: 'adfa'),
  JanmaInfo(title: 'adfa'),
];
