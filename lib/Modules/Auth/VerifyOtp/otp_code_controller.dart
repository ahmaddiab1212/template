import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class OtpCodeController extends ControllerMVC {
  // singleton
  factory OtpCodeController() {
    _this ??= OtpCodeController._();
    return _this!;
  }

  static OtpCodeController? _this;

  OtpCodeController._();

  bool loading = false,
      autoValidate = false;
  late Function(String)? onConfirm;
  late TextEditingController otpCodeController;

  @override
  void initState() {
    otpCodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpCodeController.dispose();
    super.dispose();
  }

  Future conform(BuildContext context) async {
    setState(() {loading = true;});
    if (onConfirm != null) await onConfirm!(otpCodeController.text);
    setState(() {loading = false;});
  }



}
