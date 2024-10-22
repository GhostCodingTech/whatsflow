import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'call_notifications_nav_model.dart';
export 'call_notifications_nav_model.dart';

class CallNotificationsNavWidget extends StatefulWidget {
  const CallNotificationsNavWidget({super.key});

  @override
  State<CallNotificationsNavWidget> createState() =>
      _CallNotificationsNavWidgetState();
}

class _CallNotificationsNavWidgetState
    extends State<CallNotificationsNavWidget> {
  late CallNotificationsNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallNotificationsNavModel());

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
              Icons.call_outlined,
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
            Icons.call_outlined,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 20.0,
          ),
        ),
      ],
    );
  }
}
