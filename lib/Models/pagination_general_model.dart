import 'package:template/Models/paginatino_model.dart';

abstract class PaginationGeneralModel<T> {
  List<T> get listData;

  set listData(List<T> data);

  PaginationModel? get paginationModel;

  set paginationModel(PaginationModel? pagination);
}
