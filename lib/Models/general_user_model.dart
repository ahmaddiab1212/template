

import 'package:template/Models/paginatino_model.dart';
import 'package:template/Models/pagination_general_model.dart';
import 'package:template/Models/user_model.dart';

class GeneralUserModel implements PaginationGeneralModel<UserModel>{
  GeneralUserModel({
    this.users = const [],
    this.links,
  });

  List<UserModel> users;
  PaginationModel? links;

  factory GeneralUserModel.fromMap(Map<String, dynamic> json) => GeneralUserModel(
    users: json["data"] == null ? [] : List<UserModel>.from(json["data"]!.map((x) => UserModel.fromMap(x))),
    links: json["links"] == null ? null : PaginationModel.fromMap(json["links"]),
  );

  Map<String, dynamic> toMap() => {
    "data":  List<dynamic>.from(users.map((x) => x.toMap())),
    "links": links?.toMap(),
  };

  @override
  List<UserModel> get listData => users;

  @override
  PaginationModel? get paginationModel => links;

  @override
  set listData(List<UserModel> data) {
    users = data;
  }

  @override
  set paginationModel(PaginationModel? pagination) {
    links = pagination;
  }
}