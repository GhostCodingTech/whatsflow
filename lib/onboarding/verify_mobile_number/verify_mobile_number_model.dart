import '/flutter_flow/flutter_flow_util.dart';
import 'verify_mobile_number_widget.dart' show VerifyMobileNumberWidget;
import 'package:flutter/material.dart';

class VerifyMobileNumberModel
    extends FlutterFlowModel<VerifyMobileNumberWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
