import '../../../generated/assets.dart';

class User {
  String? id;
  String? username;
  String? fullName;
  String? password;
  String? role;
  String? userImg;

  User({
    this.id,
    this.fullName,
    this.password,
    this.username,
    this.role,
    this.userImg = Assets.iconsUserIcon,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': id,
      'user_name': username,
      'full_name': fullName,
      'password': password,
      'role': role,
      'profile_img': userImg,
    };
    return map;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['user_id'],
      username: map['user_name'],
      fullName: map['full_name'],
      password: map['password'],
      role: map['role'],
      userImg: map['profile_img'],
    );
  }
}