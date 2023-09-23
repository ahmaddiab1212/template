class PaginationModel {
  PaginationModel({
    this.nextPage,
  });

  final String? nextPage;


  factory PaginationModel.fromMap(Map<String, dynamic> json) => PaginationModel(
    nextPage: json["next"]?.toString().substring(json["next"].toString().lastIndexOf("=")),
  );

  Map<String, dynamic> toMap() => {
    "next": nextPage,
  };
}