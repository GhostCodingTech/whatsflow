import '/components/call_notifications_nav/call_notifications_nav_widget.dart';
import '/components/chats_notifications_stack/chats_notifications_stack_widget.dart';
import '/components/incomming_call_box/incomming_call_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_home_page_widget.dart' show ChatHomePageWidget;
import 'package:flutter/material.dart';

class ChatHomePageModel extends FlutterFlowModel<ChatHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Incomming_Call_Box component.
  late IncommingCallBoxModel incommingCallBoxModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Chats_Notifications_Stack component.
  late ChatsNotificationsStackModel chatsNotificationsStackModel;
  // Model for Call_Notifications_Nav component.
  late CallNotificationsNavModel callNotificationsNavModel;

  @override
  void initState(BuildContext context) {
    incommingCallBoxModel = createModel(context, () => IncommingCallBoxModel());
    chatsNotificationsStackModel =
        createModel(context, () => ChatsNotificationsStackModel());
    callNotificationsNavModel =
        createModel(context, () => CallNotificationsNavModel());
  }

  @override
  void dispose() {
    incommingCallBoxModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    chatsNotificationsStackModel.dispose();
    callNotificationsNavModel.dispose();
  }
}
