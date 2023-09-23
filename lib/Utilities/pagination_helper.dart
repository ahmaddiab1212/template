import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:template/Utilities/helper.dart';
import 'package:template/Utilities/theme_helper.dart';

import '../Models/pagination_general_model.dart';

class CustomPaginationWidget<T> extends StatefulWidget {
  final PaginationController<T> paginationController;
  final Widget child;
  final Function()? onLoading;

  const CustomPaginationWidget(
      {Key? key, required this.child, required this.paginationController, this.onLoading})
      : super(key: key);

  @override
  State createState() => _PaginatedListState();
}

class _PaginatedListState extends State<CustomPaginationWidget> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      footer: const CustomFooterWidget(),
      controller: widget.paginationController.refreshController,
      onRefresh: () => widget.paginationController.loadPaginationGenericModel(forceLoad: true),
      onLoading: (){
        if(widget.onLoading!=null) widget.onLoading!();
        widget.paginationController.loadPaginationGenericModel();
      },
      child: widget.child,
    );
  }
}

class CustomFooterWidget extends StatelessWidget {
  const CustomFooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        if (mode == LoadStatus.idle) {
          return SizedBox(
              height: 50.h, child: Center(child: Text("swipe to load".tr)));
        } else if (mode == LoadStatus.loading) {
          return SizedBox(
              height: 50.h,
              child: Center(
                  child: CircularProgressIndicator(
                color: ThemeClass.primaryColor,
              )));
        }
        return const SizedBox();
      },
    );
  }
}


class PaginationController<T> {
  final Future<PaginationGeneralModel<T>?> Function(String? nextPage) getData;
  final Function() loadingInit, loadingFinished;

  PaginationController(
      {required this.loadingFinished,
        required this.loadingInit,
        required this.getData,
        });

  PaginationGeneralModel<T>? paginationGenericModel;
  RefreshController refreshController = RefreshController(initialRefresh: true);


  Future loadPaginationGenericModel({bool forceLoad = false}) async {
    if (paginationGenericModel == null || forceLoad) {
      loadingInit();
      paginationGenericModel = await getData(null);
      loadingFinished();
    } else {
      if (paginationGenericModel!.paginationModel?.nextPage != null) {
        String? nextPage = paginationGenericModel?.paginationModel?.nextPage;
        PaginationGeneralModel<T>? temp = await getData(nextPage);
        if (temp == null) return;
        paginationGenericModel?.paginationModel = temp.paginationModel;
        paginationGenericModel?.listData.addAll(temp.listData);
        loadingFinished();
      }
    }
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }
}
