import '/backend/backend.dart';
import '/components/incomming_call_box/incomming_call_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_call_page_widget.dart' show NewCallPageWidget;
import 'package:flutter/material.dart';

class NewCallPageModel extends FlutterFlowModel<NewCallPageWidget> {
  ///  Local state fields for this page.

  bool search = false;

  DocumentReference? startCall;

  bool recents = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Incomming_Call_Box component.
  late IncommingCallBoxModel incommingCallBoxModel;
  // Stores action output result for [Custom Action - generateToken] action in IconButton widget.
  String? generateVideoToken;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CallsRecord? createVideoCallRecents;
  // Stores action output result for [Custom Action - generateToken] action in IconButton widget.
  String? generateToken;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CallsRecord? createVoiceCallRecents;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  CallsRecord? readVoiceCallRecents;
  // Stores action output result for [Custom Action - generateToken] action in IconButton widget.
  String? videoToken;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CallsRecord? createVideoCall;
  // Stores action output result for [Custom Action - generateToken] action in IconButton widget.
  String? voiceToken;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CallsRecord? createVoiceCall;

  @override
  void initState(BuildContext context) {
    incommingCallBoxModel = createModel(context, () => IncommingCallBoxModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    incommingCallBoxModel.dispose();
  }
}
