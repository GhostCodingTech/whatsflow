import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'call_button_model.dart';
export 'call_button_model.dart';

class CallButtonWidget extends StatefulWidget {
  const CallButtonWidget({
    super.key,
    this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<CallButtonWidget> createState() => _CallButtonWidgetState();
}

class _CallButtonWidgetState extends State<CallButtonWidget> {
  late CallButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: FlutterFlowIconButton(
        borderColor: FlutterFlowTheme.of(context).primary,
        borderRadius: 50.0,
        borderWidth: 2.0,
        buttonSize: 45.0,
        fillColor: FlutterFlowTheme.of(context).primaryBackground,
        icon: Icon(
          Icons.call,
          color: FlutterFlowTheme.of(context).tertiary,
          size: 20.0,
        ),
        onPressed: () {
          print('IconButton pressed ...');
        },
      ),
    );
  }
}
