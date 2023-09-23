import 'dart:convert';


UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({this.token});

  String? token;
  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(token: json[""]);

  Map<String, dynamic> toMap() => {

  };
}
