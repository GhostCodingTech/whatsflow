import '/components/incomming_call_box/incomming_call_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contacts_page_widget.dart' show ContactsPageWidget;
import 'package:flutter/material.dart';

class ContactsPageModel extends FlutterFlowModel<ContactsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Incomming_Call_Box component.
  late IncommingCallBoxModel incommingCallBoxModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    incommingCallBoxModel = createModel(context, () => IncommingCallBoxModel());
  }

  @override
  void dispose() {
    incommingCallBoxModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
