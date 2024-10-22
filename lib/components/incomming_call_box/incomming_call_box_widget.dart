import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'incomming_call_box_model.dart';
export 'incomming_call_box_model.dart';

class IncommingCallBoxWidget extends StatefulWidget {
  const IncommingCallBoxWidget({
    super.key,
    this.callRef,
  });

  final DocumentReference? callRef;

  @override
  State<IncommingCallBoxWidget> createState() => _IncommingCallBoxWidgetState();
}

class _IncommingCallBoxWidgetState extends State<IncommingCallBoxWidget> {
  late IncommingCallBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncommingCallBoxModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).incommingCall,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: StreamBuilder<CallsRecord>(
          stream: CallsRecord.getDocument(widget.callRef!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return const Center(
                child: SizedBox(
                  width: 10.0,
                  height: 10.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.transparent,
                    ),
                  ),
                ),
              );
            }

            final columnCallsRecord = snapshot.data!;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(columnCallsRecord.userA!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return const Center(
                        child: SizedBox(
                          width: 10.0,
                          height: 10.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.transparent,
                            ),
                          ),
                        ),
                      );
                    }

                    final rowUsersRecord = snapshot.data!;

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 45.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                rowUsersRecord.photoUrl,
                              ),
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Visibility(
                            visible: rowUsersRecord.photoUrl == '',
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/placeholder_image.jpg',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rowUsersRecord.displayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              'Incoming call',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ].divide(const SizedBox(width: 5.0)),
                    );
                  },
                ),
                StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(columnCallsRecord.userA!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return const Center(
                        child: SizedBox(
                          width: 10.0,
                          height: 10.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.transparent,
                            ),
                          ),
                        ),
                      );
                    }

                    final rowUsersRecord = snapshot.data!;

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await widget.callRef!.update({
                              ...createCallsRecordData(
                                callEnded: true,
                                callDeclined: true,
                                ringing: false,
                                declinedBy: currentUserReference,
                              ),
                              ...mapToFirestore(
                                {
                                  'users': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });

                            await currentUserDocument!.userCallManagement!
                                .update({
                              ...createUserCallManagementRecordData(
                                active: false,
                                incomming: false,
                              ),
                              ...mapToFirestore(
                                {
                                  'activeCallRef': FieldValue.delete(),
                                },
                              ),
                            });

                            await rowUsersRecord.userCallManagement!.update({
                              ...createUserCallManagementRecordData(
                                active: false,
                                incomming: false,
                              ),
                              ...mapToFirestore(
                                {
                                  'activeCallRef': FieldValue.delete(),
                                },
                              ),
                            });
                          },
                          text: 'Decline',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFE3000D),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await widget.callRef!.update({
                              ...createCallsRecordData(
                                userBJoined: true,
                                ringing: false,
                              ),
                              ...mapToFirestore(
                                {
                                  'users': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });

                            context.pushNamed(
                              'Call_Screen',
                              queryParameters: {
                                'callRef': serializeParam(
                                  widget.callRef,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.scale,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 250),
                                ),
                              },
                            );

                            unawaited(
                              () async {
                                await currentUserDocument!.userCallManagement!
                                    .update(createUserCallManagementRecordData(
                                  active: true,
                                  incomming: false,
                                ));
                              }(),
                            );
                          },
                          text: 'Answer',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF00B227),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ].divide(const SizedBox(width: 5.0)),
                    );
                  },
                ),
              ]
                  .divide(const SizedBox(height: 20.0))
                  .addToStart(const SizedBox(height: 20.0))
                  .addToEnd(const SizedBox(height: 20.0)),
            );
          },
        ),
      ),
    );
  }
}
