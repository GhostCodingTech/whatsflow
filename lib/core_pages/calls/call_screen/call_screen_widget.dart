import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'call_screen_model.dart';
export 'call_screen_model.dart';

class CallScreenWidget extends StatefulWidget {
  const CallScreenWidget({
    super.key,
    required this.callRef,
  });

  final DocumentReference? callRef;

  @override
  State<CallScreenWidget> createState() => _CallScreenWidgetState();
}

class _CallScreenWidgetState extends State<CallScreenWidget>
    with TickerProviderStateMixin {
  late CallScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallScreenModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, -20.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 20.0),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 30,
            offset: const Offset(0.0, 0.0),
            rotation: 0.14,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, -20.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 20.0),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 30,
            offset: const Offset(0.0, 0.0),
            rotation: 0.14,
          ),
        ],
      ),
      'iconOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, -20.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 20.0),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 30,
            offset: const Offset(0.0, 0.0),
            rotation: 0.14,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
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

              final stackCallsRecord = snapshot.data!;

              return Stack(
                children: [
                  StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(
                        stackCallsRecord.userA == currentUserReference
                            ? stackCallsRecord.userB!
                            : stackCallsRecord.userA!),
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

                      final stackUsersRecord = snapshot.data!;

                      return Stack(
                        children: [
                          Stack(
                            children: [
                              if (stackCallsRecord.userBJoined)
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        child: custom_widgets
                                            .GhostCodingBasicVoiceChannel(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          token: stackCallsRecord.tokenId,
                                          appID: stackCallsRecord.appId,
                                          channelName:
                                              stackCallsRecord.channelName,
                                          backgroundValue:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          headPercentageWidth: 1.0,
                                          headPercentageHeight: 0.85,
                                          mainContainerBorderRadius: 0.0,
                                          mainContainerBackground:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          profilePictureWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.95,
                                          profilePictureHeight:
                                              MediaQuery.sizeOf(context).width *
                                                  0.95,
                                          placeHolderImagePath:
                                              'assets/images/placeholder_image.png',
                                          userProfileImage:
                                              stackUsersRecord.photoUrl,
                                          profileBorderRadius: 1000.0,
                                          profileBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          profileBorderwidth: 2.0,
                                          actionContainerBackground:
                                              FlutterFlowTheme.of(context)
                                                  .appBar,
                                          actionContainerRadiusBL: 10.0,
                                          actionContainerRadiusBR: 10.0,
                                          actionContainerRadiusTL: 10.0,
                                          actionContainerRadiusTR: 10.0,
                                          buttonRowPadding: 10.0,
                                          buttonWidth: 45.0,
                                          buttonHeight: 45.0,
                                          endCallElevation: 8.0,
                                          endCallBorderRadius: 50.0,
                                          endCallBackground: const Color(0xFFFF0000),
                                          endCallIcon: Icon(
                                            Icons.call_end,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 24.0,
                                          ),
                                          speakerButtonElevation: 8.0,
                                          speakerButtonBorderRadius: 25.0,
                                          speakerEnabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .searchBox,
                                          speakerDisabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          speakerIconActive: Icon(
                                            Icons.volume_up,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 24.0,
                                          ),
                                          speakerIconInactive: Icon(
                                            Icons.volume_mute,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 24.0,
                                          ),
                                          activeBoxBackground:
                                              const Color(0xE90B191E),
                                          activeBoxBorderRadius: 25.0,
                                          callingTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          callingTextString: 'Connecting...',
                                          userSpeakingIcon: Icon(
                                            Icons.spatial_audio_off,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 18.0,
                                          ),
                                          userNotSpeakingIcon: Icon(
                                            Icons.spatial_audio_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 18.0,
                                          ),
                                          userFirstName:
                                              stackUsersRecord.displayName,
                                          endCallAction: () async {
                                            await widget.callRef!
                                                .update(createCallsRecordData(
                                              callEnded: true,
                                              userAJoined: false,
                                              userBJoined: false,
                                            ));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          if (stackCallsRecord.callEnded)
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            stackCallsRecord.callEnded &&
                                                    stackCallsRecord
                                                        .callDeclined
                                                ? 'Call declined by ${stackCallsRecord.declinedBy == currentUserReference ? 'You' : stackUsersRecord.displayName}'
                                                : 'Call ended with ${stackUsersRecord.displayName}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            elevation: 2.0,
                                            shape: const CircleBorder(),
                                            child: Container(
                                              width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.7,
                                                200.0,
                                              ),
                                              height: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.7,
                                                200.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    stackUsersRecord.photoUrl,
                                                  ),
                                                ),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  width: 5.0,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: stackUsersRecord.photoUrl ==
                                                        '',
                                                child: Container(
                                                  width: valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.7,
                                                    200.0,
                                                  ),
                                                  height:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.7,
                                                    200.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                          ),
                                        ].divide(const SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                borderRadius: 100.0,
                                                borderWidth: 1.0,
                                                buttonSize: 50.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                icon: Icon(
                                                  Icons.missed_video_call,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 30.0,
                                                ),
                                                onPressed: () async {
                                                  await widget.callRef!
                                                      .update({
                                                    ...createCallsRecordData(
                                                      ringing: true,
                                                      userAJoined: true,
                                                      userBJoined: false,
                                                      callDeclined: false,
                                                      userA:
                                                          currentUserReference,
                                                      userB: stackUsersRecord
                                                          .reference,
                                                      callEnded: false,
                                                      isVideo: true,
                                                      videoRequest: false,
                                                      userAUid: functions
                                                          .generateUserUID(
                                                              currentUserUid),
                                                      userBUid: functions
                                                          .generateUserUID(
                                                              stackUsersRecord
                                                                  .uid),
                                                      switchedToVideo: true,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'declined_by':
                                                            FieldValue.delete(),
                                                      },
                                                    ),
                                                  });
                                                  unawaited(
                                                    () async {
                                                      await stackUsersRecord
                                                          .userCallManagement!
                                                          .update(
                                                              createUserCallManagementRecordData(
                                                        active: false,
                                                        incomming: true,
                                                        inCall: false,
                                                        activeCallRef:
                                                            widget.callRef,
                                                        videoCallRequest: true,
                                                      ));
                                                    }(),
                                                  );
                                                  unawaited(
                                                    () async {
                                                      await currentUserDocument!
                                                          .userCallManagement!
                                                          .update(
                                                              createUserCallManagementRecordData(
                                                        active: true,
                                                        incomming: false,
                                                        inCall: true,
                                                        activeCallRef:
                                                            widget.callRef,
                                                        videoCallRequest: true,
                                                      ));
                                                    }(),
                                                  );
                                                },
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                borderRadius: 100.0,
                                                borderWidth: 1.0,
                                                buttonSize: 50.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                icon: Icon(
                                                  Icons.phone_callback,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 30.0,
                                                ),
                                                onPressed: () async {
                                                  await widget.callRef!
                                                      .update({
                                                    ...createCallsRecordData(
                                                      ringing: true,
                                                      userAJoined: true,
                                                      userBJoined: false,
                                                      callDeclined: false,
                                                      userA:
                                                          currentUserReference,
                                                      userB: stackUsersRecord
                                                          .reference,
                                                      callEnded: false,
                                                      isVideo: false,
                                                      videoRequest: false,
                                                      userAUid: functions
                                                          .generateUserUID(
                                                              currentUserUid),
                                                      userBUid: functions
                                                          .generateUserUID(
                                                              stackUsersRecord
                                                                  .uid),
                                                      switchedToVideo: false,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'declined_by':
                                                            FieldValue.delete(),
                                                      },
                                                    ),
                                                  });

                                                  await stackUsersRecord
                                                      .userCallManagement!
                                                      .update(
                                                          createUserCallManagementRecordData(
                                                    active: false,
                                                    incomming: true,
                                                    inCall: false,
                                                    activeCallRef:
                                                        widget.callRef,
                                                  ));

                                                  await currentUserDocument!
                                                      .userCallManagement!
                                                      .update(
                                                          createUserCallManagementRecordData(
                                                    active: true,
                                                    incomming: false,
                                                    inCall: true,
                                                    activeCallRef:
                                                        widget.callRef,
                                                  ));
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (stackCallsRecord.ringing &&
                              (stackCallsRecord.userB == currentUserReference))
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Material(
                                            color: Colors.transparent,
                                            elevation: 2.0,
                                            shape: const CircleBorder(),
                                            child: Container(
                                              width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.7,
                                                200.0,
                                              ),
                                              height: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.7,
                                                200.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    stackUsersRecord.photoUrl,
                                                  ),
                                                ),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  width: 5.0,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: stackUsersRecord.photoUrl ==
                                                        '',
                                                child: Container(
                                                  width: valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.7,
                                                    200.0,
                                                  ),
                                                  height:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.7,
                                                    200.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                          ),
                                          Text(
                                            stackUsersRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  DragTarget<String>(
                                                    onAcceptWithDetails:
                                                        (details) async {
                                                      await widget.callRef!
                                                          .update({
                                                        ...createCallsRecordData(
                                                          ringing: false,
                                                          callEnded: true,
                                                          userAJoined: false,
                                                          userBJoined: false,
                                                          callDeclined: true,
                                                          declinedBy:
                                                              currentUserReference,
                                                          isVideo: false,
                                                          videoRequest: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'users': FieldValue
                                                                .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                            'videoRequester':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await stackUsersRecord
                                                          .userCallManagement!
                                                          .update({
                                                        ...createUserCallManagementRecordData(
                                                          active: false,
                                                          incomming: false,
                                                          inCall: false,
                                                          videoCallRequest:
                                                              false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'activeCallRef':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await currentUserDocument!
                                                          .userCallManagement!
                                                          .update({
                                                        ...createUserCallManagementRecordData(
                                                          active: false,
                                                          incomming: false,
                                                          inCall: false,
                                                          videoCallRequest:
                                                              false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'activeCallRef':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      safeSetState(() {});
                                                    },
                                                    builder: (context, _, __) {
                                                      return Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0x44FF0000),
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFFF0000),
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  const Icon(
                                                    Icons
                                                        .keyboard_double_arrow_up,
                                                    color: Color(0xFFFF0000),
                                                    size: 35.0,
                                                  ).animateOnPageLoad(animationsMap[
                                                      'iconOnPageLoadAnimation1']!),
                                                  Draggable<String>(
                                                    data: '',
                                                    feedback: Material(
                                                      type: MaterialType
                                                          .transparency,
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            const Color(0xFFFF0000),
                                                        borderRadius: 50.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 50.0,
                                                        fillColor:
                                                            const Color(0xFFFF0000),
                                                        icon: Icon(
                                                          Icons.call_end,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 26.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconButtonOnPageLoadAnimation1']!),
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          const Color(0xFFFF0000),
                                                      borderRadius: 50.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 50.0,
                                                      fillColor:
                                                          const Color(0xFFFF0000),
                                                      icon: Icon(
                                                        Icons.call_end,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 26.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ).animateOnPageLoad(
                                                            animationsMap[
                                                                'iconButtonOnPageLoadAnimation1']!),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 20.0)),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  DragTarget<String>(
                                                    onAcceptWithDetails:
                                                        (details) async {
                                                      await widget.callRef!
                                                          .update({
                                                        ...createCallsRecordData(
                                                          ringing: false,
                                                          userBJoined: true,
                                                          videoRequest: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'users': FieldValue
                                                                .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                            'videoRequester':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                      unawaited(
                                                        () async {
                                                          await stackUsersRecord
                                                              .userCallManagement!
                                                              .update(
                                                                  createUserCallManagementRecordData(
                                                            active: true,
                                                            incomming: false,
                                                            inCall: true,
                                                            videoCallRequest:
                                                                false,
                                                          ));
                                                        }(),
                                                      );
                                                      unawaited(
                                                        () async {
                                                          await currentUserDocument!
                                                              .userCallManagement!
                                                              .update(
                                                                  createUserCallManagementRecordData(
                                                            active: true,
                                                            incomming: false,
                                                            inCall: true,
                                                            videoCallRequest:
                                                                false,
                                                          ));
                                                        }(),
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                    builder: (context, _, __) {
                                                      return Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0x6300BF2B),
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFF00FF39),
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .keyboard_double_arrow_up,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 35.0,
                                                  ).animateOnPageLoad(animationsMap[
                                                      'iconOnPageLoadAnimation2']!),
                                                  Draggable<String>(
                                                    data: '',
                                                    feedback: Material(
                                                      type: MaterialType
                                                          .transparency,
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        borderRadius: 50.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 50.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        icon: Icon(
                                                          Icons.call,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 26.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconButtonOnPageLoadAnimation2']!),
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      borderRadius: 50.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 50.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      icon: Icon(
                                                        Icons.call,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 26.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ).animateOnPageLoad(
                                                            animationsMap[
                                                                'iconButtonOnPageLoadAnimation2']!),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 20.0)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (stackCallsRecord.ringing &&
                              (stackCallsRecord.userA == currentUserReference))
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: stackCallsRecord.isVideo
                                    ? Colors.transparent
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          if (!stackCallsRecord.isVideo)
                                            Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: const CircleBorder(),
                                              child: Container(
                                                width: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.7,
                                                  200.0,
                                                ),
                                                height: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.7,
                                                  200.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      stackUsersRecord.photoUrl,
                                                    ),
                                                  ),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    width: 5.0,
                                                  ),
                                                ),
                                                child: Visibility(
                                                  visible: stackUsersRecord
                                                              .photoUrl ==
                                                          '',
                                                  child: Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.7,
                                                      200.0,
                                                    ),
                                                    height:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.7,
                                                      200.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                            ),
                                          Text(
                                            'Calling ${stackUsersRecord.displayName}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              shadows: [
                                                Shadow(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  offset: const Offset(0.5, 0.5),
                                                  blurRadius: 1.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  DragTarget<String>(
                                                    onAcceptWithDetails:
                                                        (details) async {
                                                      await widget.callRef!
                                                          .update({
                                                        ...createCallsRecordData(
                                                          ringing: false,
                                                          callEnded: true,
                                                          userAJoined: false,
                                                          userBJoined: false,
                                                          isVideo: false,
                                                          videoRequest: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'users': FieldValue
                                                                .arrayUnion([
                                                              stackUsersRecord
                                                                  .reference
                                                            ]),
                                                            'videoRequester':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await stackUsersRecord
                                                          .userCallManagement!
                                                          .update({
                                                        ...createUserCallManagementRecordData(
                                                          active: false,
                                                          incomming: false,
                                                          inCall: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'activeCallRef':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await currentUserDocument!
                                                          .userCallManagement!
                                                          .update({
                                                        ...createUserCallManagementRecordData(
                                                          active: false,
                                                          incomming: false,
                                                          inCall: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'activeCallRef':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      safeSetState(() {});
                                                    },
                                                    builder: (context, _, __) {
                                                      return Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0x44FF0000),
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFFF0000),
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  const Icon(
                                                    Icons
                                                        .keyboard_double_arrow_up,
                                                    color: Color(0xFFFF0000),
                                                    size: 35.0,
                                                  ).animateOnPageLoad(animationsMap[
                                                      'iconOnPageLoadAnimation3']!),
                                                  Draggable<String>(
                                                    data: '',
                                                    feedback: Material(
                                                      type: MaterialType
                                                          .transparency,
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            const Color(0xFFFF0000),
                                                        borderRadius: 50.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 50.0,
                                                        fillColor:
                                                            const Color(0xFFFF0000),
                                                        icon: Icon(
                                                          Icons.call_end,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 26.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconButtonOnPageLoadAnimation3']!),
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          const Color(0xFFFF0000),
                                                      borderRadius: 50.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 50.0,
                                                      fillColor:
                                                          const Color(0xFFFF0000),
                                                      icon: Icon(
                                                        Icons.call_end,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 26.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ).animateOnPageLoad(
                                                            animationsMap[
                                                                'iconButtonOnPageLoadAnimation3']!),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 20.0)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  if (stackCallsRecord.callEnded)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ].addToStart(const SizedBox(width: 15.0)),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
