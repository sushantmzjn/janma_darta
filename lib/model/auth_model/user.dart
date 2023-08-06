import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String access_token;

  User({required this.access_token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(access_token: json['access_token'] ?? '');
  }
}
