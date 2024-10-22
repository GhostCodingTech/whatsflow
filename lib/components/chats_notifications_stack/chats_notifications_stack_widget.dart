import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'chats_notifications_stack_model.dart';
export 'chats_notifications_stack_model.dart';

class ChatsNotificationsStackWidget extends StatefulWidget {
  const ChatsNotificationsStackWidget({super.key});

  @override
  State<ChatsNotificationsStackWidget> createState() =>
      _ChatsNotificationsStackWidgetState();
}

class _ChatsNotificationsStackWidgetState
    extends State<ChatsNotificationsStackWidget> {
  late ChatsNotificationsStackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsNotificationsStackModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: const BoxDecoration(),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: badges.Badge(
            badgeContent: Text(
              '1',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 9.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            showBadge: true,
            shape: badges.BadgeShape.circle,
            badgeColor: FlutterFlowTheme.of(context).tertiary,
            elevation: 4.0,
            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
            position: badges.BadgePosition.topEnd(),
            animationType: badges.BadgeAnimationType.scale,
            toAnimate: true,
            child: Icon(
              Icons.chat_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 20.0,
            ),
          ),
        ),
        Container(
          width: 40.0,
          height: 40.0,
          decoration: const BoxDecoration(),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Icon(
            Icons.chat_outlined,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 20.0,
          ),
        ),
      ],
    );
  }
}
