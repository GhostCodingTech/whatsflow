import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/incomming_call_box/incomming_call_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new_call_page_model.dart';
export 'new_call_page_model.dart';

class NewCallPageWidget extends StatefulWidget {
  const NewCallPageWidget({super.key});

  @override
  State<NewCallPageWidget> createState() => _NewCallPageWidgetState();
}

class _NewCallPageWidgetState extends State<NewCallPageWidget> {
  late NewCallPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewCallPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 4.0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).appBar,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        if (!_model.search)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Text(
                                'Select contact',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.search_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.search = true;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ].addToEnd(const SizedBox(width: 10.0)),
                                ),
                              ),
                            ]
                                .divide(const SizedBox(width: 10.0))
                                .addToStart(const SizedBox(width: 10.0)),
                          ),
                        if (_model.search)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).searchBox,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          _model.search = false;
                                          safeSetState(() {});
                                        },
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            const Duration(milliseconds: 100),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: true,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction:
                                              TextInputAction.search,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Search...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      if (_model.textController.text != '')
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.clear_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            safeSetState(() {
                                              _model.textController?.clear();
                                            });
                                          },
                                        ),
                                    ]
                                        .addToStart(const SizedBox(width: 8.0))
                                        .addToEnd(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ]
                                .addToStart(const SizedBox(width: 10.0))
                                .addToEnd(const SizedBox(width: 10.0)),
                          ),
                      ],
                    ),
                    AuthUserStreamWidget(
                      builder: (context) =>
                          StreamBuilder<UserCallManagementRecord>(
                        stream: UserCallManagementRecord.getDocument(
                            currentUserDocument!.userCallManagement!),
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

                          final columnUserCallManagementRecord = snapshot.data!;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (columnUserCallManagementRecord.incomming)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model.incommingCallBoxModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: IncommingCallBoxWidget(
                                            callRef:
                                                columnUserCallManagementRecord
                                                    .activeCallRef,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .addToStart(const SizedBox(width: 10.0))
                                      .addToEnd(const SizedBox(width: 10.0)),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ].addToStart(const SizedBox(height: 40.0)),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recently Called Users',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Builder(
                          builder: (context) {
                            final recentlyCalledUsers = FFAppState()
                                .recentlyCalledUsers
                                .map((e) => e)
                                .toList()
                                .take(10)
                                .toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: recentlyCalledUsers.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 8.0),
                              itemBuilder: (context, recentlyCalledUsersIndex) {
                                final recentlyCalledUsersItem =
                                    recentlyCalledUsers[
                                        recentlyCalledUsersIndex];
                                return StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      recentlyCalledUsersItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 10.0,
                                          height: 10.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
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
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 45.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      rowUsersRecord.photoUrl,
                                                    ),
                                                  ),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Visibility(
                                                  visible: rowUsersRecord.photoUrl ==
                                                          '',
                                                  child: Container(
                                                    width: 45.0,
                                                    height: 45.0,
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
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    rowUsersRecord.displayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  if (_model.recents &&
                                                      (_model.startCall ==
                                                          rowUsersRecord
                                                              .reference))
                                                    Text(
                                                      'Calling....',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                ],
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (_model.startCall == null)
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 50.0,
                                                borderWidth: 2.0,
                                                buttonSize: 45.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                icon: Icon(
                                                  Icons.video_call_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  _model.startCall =
                                                      rowUsersRecord.reference;
                                                  _model.recents = true;
                                                  safeSetState(() {});
                                                  _model.generateVideoToken =
                                                      await actions
                                                          .generateToken(
                                                    FFAppState().appId,
                                                    FFAppState().appCertificate,
                                                    '${rowUsersRecord.displayName}$currentUserDisplayName',
                                                    '0',
                                                  );

                                                  var callsRecordReference =
                                                      CallsRecord.collection
                                                          .doc();
                                                  await callsRecordReference
                                                      .set({
                                                    ...createCallsRecordData(
                                                      userA:
                                                          currentUserReference,
                                                      userB: rowUsersRecord
                                                          .reference,
                                                      channelName:
                                                          '${rowUsersRecord.displayName}$currentUserDisplayName',
                                                      ringing: true,
                                                      callEnded: false,
                                                      callDeclined: false,
                                                      userAJoined: true,
                                                      userBJoined: false,
                                                      callPlacedAt:
                                                          getCurrentTimestamp,
                                                      isVideo: true,
                                                      userAUid: functions
                                                          .generateUserUID(
                                                              currentUserUid),
                                                      userBUid: functions
                                                          .generateUserUID(
                                                              rowUsersRecord
                                                                  .uid),
                                                      videoRequest: false,
                                                      switchedToVideo: true,
                                                      appId: FFAppState().appId,
                                                      tokenId: _model
                                                          .generateVideoToken,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'users': [
                                                          currentUserReference
                                                        ],
                                                      },
                                                    ),
                                                  });
                                                  _model.createVideoCallRecents =
                                                      CallsRecord
                                                          .getDocumentFromData({
                                                    ...createCallsRecordData(
                                                      userA:
                                                          currentUserReference,
                                                      userB: rowUsersRecord
                                                          .reference,
                                                      channelName:
                                                          '${rowUsersRecord.displayName}$currentUserDisplayName',
                                                      ringing: true,
                                                      callEnded: false,
                                                      callDeclined: false,
                                                      userAJoined: true,
                                                      userBJoined: false,
                                                      callPlacedAt:
                                                          getCurrentTimestamp,
                                                      isVideo: true,
                                                      userAUid: functions
                                                          .generateUserUID(
                                                              currentUserUid),
                                                      userBUid: functions
                                                          .generateUserUID(
                                                              rowUsersRecord
                                                                  .uid),
                                                      videoRequest: false,
                                                      switchedToVideo: true,
                                                      appId: FFAppState().appId,
                                                      tokenId: _model
                                                          .generateVideoToken,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'users': [
                                                          currentUserReference
                                                        ],
                                                      },
                                                    ),
                                                  }, callsRecordReference);
                                                  FFAppState()
                                                      .removeFromRecentlyCalledUsers(
                                                          rowUsersRecord
                                                              .reference);
                                                  safeSetState(() {});
                                                  FFAppState()
                                                          .recentlyCalledUsers =
                                                      functions
                                                          .addItemAtTopOfList(
                                                              FFAppState()
                                                                  .recentlyCalledUsers
                                                                  .toList(),
                                                              rowUsersRecord
                                                                  .reference)!
                                                          .toList()
                                                          .cast<
                                                              DocumentReference>();
                                                  safeSetState(() {});

                                                  await currentUserDocument!
                                                      .userCallManagement!
                                                      .update(
                                                          createUserCallManagementRecordData(
                                                    active: true,
                                                    incomming: false,
                                                    activeCallRef: _model
                                                        .createVideoCallRecents
                                                        ?.reference,
                                                    videoCallRequest: true,
                                                  ));

                                                  await rowUsersRecord
                                                      .userCallManagement!
                                                      .update(
                                                          createUserCallManagementRecordData(
                                                    active: false,
                                                    incomming: true,
                                                    activeCallRef: _model
                                                        .createVideoCallRecents
                                                        ?.reference,
                                                    videoCallRequest: true,
                                                  ));
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        currentUserDisplayName,
                                                    notificationText:
                                                        'Incoming call',
                                                    notificationImageUrl:
                                                        currentUserPhoto,
                                                    notificationSound:
                                                        'default',
                                                    userRefs: [
                                                      rowUsersRecord.reference
                                                    ],
                                                    initialPageName:
                                                        'Call_Screen',
                                                    parameterData: {
                                                      'callRef': _model
                                                          .createVideoCallRecents
                                                          ?.reference,
                                                    },
                                                  );
                                                  _model.startCall = null;
                                                  _model.recents = false;
                                                  safeSetState(() {});

                                                  context.pushNamed(
                                                    'Call_Screen',
                                                    queryParameters: {
                                                      'callRef': serializeParam(
                                                        _model
                                                            .createVideoCallRecents
                                                            ?.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .scale,
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        duration: Duration(
                                                            milliseconds: 250),
                                                      ),
                                                    },
                                                  );

                                                  safeSetState(() {});
                                                },
                                              ),
                                            if (_model.startCall == null)
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 50.0,
                                                borderWidth: 2.0,
                                                buttonSize: 45.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                icon: Icon(
                                                  Icons.call,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  _model.startCall =
                                                      rowUsersRecord.reference;
                                                  _model.recents = true;
                                                  safeSetState(() {});
                                                  _model.generateToken =
                                                      await actions
                                                          .generateToken(
                                                    FFAppState().appId,
                                                    FFAppState().appCertificate,
                                                    '${rowUsersRecord.displayName}$currentUserDisplayName',
                                                    '0',
                                                  );

                                                  var callsRecordReference1 =
                                                      CallsRecord.collection
                                                          .doc();
                                                  await callsRecordReference1
                                                      .set({
                                                    ...createCallsRecordData(
                                                      userA:
                                                          currentUserReference,
                                                      userB: rowUsersRecord
                                                          .reference,
                                                      channelName:
                                                          '${rowUsersRecord.displayName}$currentUserDisplayName',
                                                      ringing: true,
                                                      callEnded: false,
                                                      callDeclined: false,
                                                      userAJoined: true,
                                                      userBJoined: false,
                                                      callPlacedAt:
                                                          getCurrentTimestamp,
                                                      isVideo: false,
                                                      userAUid: functions
                                                          .generateUserUID(
                                                              currentUserUid),
                                                      userBUid: functions
                                                          .generateUserUID(
                                                              rowUsersRecord
                                                                  .uid),
                                                      videoRequest: false,
                                                      switchedToVideo: false,
                                                      appId: FFAppState().appId,
                                                      tokenId:
                                                          _model.generateToken,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'users': [
                                                          currentUserReference
                                                        ],
                                                      },
                                                    ),
                                                  });
                                                  _model.createVoiceCallRecents =
                                                      CallsRecord
                                                          .getDocumentFromData({
                                                    ...createCallsRecordData(
                                                      userA:
                                                          currentUserReference,
                                                      userB: rowUsersRecord
                                                          .reference,
                                                      channelName:
                                                          '${rowUsersRecord.displayName}$currentUserDisplayName',
                                                      ringing: true,
                                                      callEnded: false,
                                                      callDeclined: false,
                                                      userAJoined: true,
                                                      userBJoined: false,
                                                      callPlacedAt:
                                                          getCurrentTimestamp,
                                                      isVideo: false,
                                                      userAUid: functions
                                                          .generateUserUID(
                                                              currentUserUid),
                                                      userBUid: functions
                                                          .generateUserUID(
                                                              rowUsersRecord
                                                                  .uid),
                                                      videoRequest: false,
                                                      switchedToVideo: false,
                                                      appId: FFAppState().appId,
                                                      tokenId:
                                                          _model.generateToken,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'users': [
                                                          currentUserReference
                                                        ],
                                                      },
                                                    ),
                                                  }, callsRecordReference1);
                                                  FFAppState()
                                                      .removeFromRecentlyCalledUsers(
                                                          rowUsersRecord
                                                              .reference);
                                                  safeSetState(() {});
                                                  FFAppState()
                                                          .recentlyCalledUsers =
                                                      functions
                                                          .addItemAtTopOfList(
                                                              FFAppState()
                                                                  .recentlyCalledUsers
                                                                  .toList(),
                                                              rowUsersRecord
                                                                  .reference)!
                                                          .toList()
                                                          .cast<
                                                              DocumentReference>();
                                                  safeSetState(() {});

                                                  await currentUserDocument!
                                                      .userCallManagement!
                                                      .update(
                                                          createUserCallManagementRecordData(
                                                    active: true,
                                                    incomming: false,
                                                    activeCallRef: _model
                                                        .createVoiceCallRecents
                                                        ?.reference,
                                                  ));

                                                  await rowUsersRecord
                                                      .userCallManagement!
                                                      .update(
                                                          createUserCallManagementRecordData(
                                                    active: false,
                                                    incomming: true,
                                                    activeCallRef: _model
                                                        .createVoiceCallRecents
                                                        ?.reference,
                                                  ));
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        currentUserDisplayName,
                                                    notificationText:
                                                        'Incoming call',
                                                    notificationImageUrl:
                                                        currentUserPhoto,
                                                    notificationSound:
                                                        'default',
                                                    userRefs: [
                                                      rowUsersRecord.reference
                                                    ],
                                                    initialPageName:
                                                        'Call_Screen',
                                                    parameterData: {
                                                      'callRef': _model
                                                          .createVoiceCallRecents
                                                          ?.reference,
                                                    },
                                                  );
                                                  _model.startCall = null;
                                                  _model.recents = false;
                                                  safeSetState(() {});
                                                  _model.readVoiceCallRecents =
                                                      await CallsRecord
                                                          .getDocumentOnce(_model
                                                              .createVoiceCallRecents!
                                                              .reference);
                                                  while (_model
                                                              .readVoiceCallRecents
                                                              ?.tokenId ==
                                                          null ||
                                                      _model.readVoiceCallRecents
                                                              ?.tokenId ==
                                                          '') {
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 10));
                                                  }

                                                  context.pushNamed(
                                                    'Call_Screen',
                                                    queryParameters: {
                                                      'callRef': serializeParam(
                                                        _model
                                                            .createVoiceCallRecents
                                                            ?.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .scale,
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        duration: Duration(
                                                            milliseconds: 250),
                                                      ),
                                                    },
                                                  );

                                                  safeSetState(() {});
                                                },
                                              ),
                                          ].divide(const SizedBox(width: 5.0)),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                        Text(
                          'Contacts on Whatsflow',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .orderBy('display_name', descending: true),
                          ),
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
                            List<UsersRecord> listViewUsersRecordList = snapshot
                                .data!
                                .where((u) => u.uid != currentUserUid)
                                .toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewUsersRecordList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 8.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewUsersRecord =
                                    listViewUsersRecordList[listViewIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 45.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                  listViewUsersRecord.photoUrl,
                                                ),
                                              ),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Visibility(
                                              visible: listViewUsersRecord
                                                          .photoUrl ==
                                                      '',
                                              child: Container(
                                                width: 45.0,
                                                height: 45.0,
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
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listViewUsersRecord.displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              if (!_model.recents &&
                                                  (_model.startCall ==
                                                      listViewUsersRecord
                                                          .reference))
                                                Text(
                                                  'Calling....',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (_model.startCall == null)
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 50.0,
                                            borderWidth: 2.0,
                                            buttonSize: 45.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            icon: Icon(
                                              Icons.video_call_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              _model.recents = false;
                                              _model.startCall =
                                                  listViewUsersRecord.reference;
                                              safeSetState(() {});
                                              _model.videoToken =
                                                  await actions.generateToken(
                                                FFAppState().appId,
                                                FFAppState().appCertificate,
                                                '${listViewUsersRecord.displayName}$currentUserDisplayName',
                                                '0',
                                              );

                                              var callsRecordReference =
                                                  CallsRecord.collection.doc();
                                              await callsRecordReference.set({
                                                ...createCallsRecordData(
                                                  userA: currentUserReference,
                                                  userB: listViewUsersRecord
                                                      .reference,
                                                  channelName:
                                                      '${listViewUsersRecord.displayName}$currentUserDisplayName',
                                                  ringing: true,
                                                  callEnded: false,
                                                  callDeclined: false,
                                                  userAJoined: true,
                                                  userBJoined: false,
                                                  callPlacedAt:
                                                      getCurrentTimestamp,
                                                  isVideo: true,
                                                  userAUid:
                                                      functions.generateUserUID(
                                                          currentUserUid),
                                                  userBUid:
                                                      functions.generateUserUID(
                                                          listViewUsersRecord
                                                              .uid),
                                                  videoRequest: false,
                                                  switchedToVideo: true,
                                                  appId: FFAppState().appId,
                                                  tokenId: _model.videoToken,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'users': [
                                                      currentUserReference
                                                    ],
                                                  },
                                                ),
                                              });
                                              _model.createVideoCall =
                                                  CallsRecord
                                                      .getDocumentFromData({
                                                ...createCallsRecordData(
                                                  userA: currentUserReference,
                                                  userB: listViewUsersRecord
                                                      .reference,
                                                  channelName:
                                                      '${listViewUsersRecord.displayName}$currentUserDisplayName',
                                                  ringing: true,
                                                  callEnded: false,
                                                  callDeclined: false,
                                                  userAJoined: true,
                                                  userBJoined: false,
                                                  callPlacedAt:
                                                      getCurrentTimestamp,
                                                  isVideo: true,
                                                  userAUid:
                                                      functions.generateUserUID(
                                                          currentUserUid),
                                                  userBUid:
                                                      functions.generateUserUID(
                                                          listViewUsersRecord
                                                              .uid),
                                                  videoRequest: false,
                                                  switchedToVideo: true,
                                                  appId: FFAppState().appId,
                                                  tokenId: _model.videoToken,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'users': [
                                                      currentUserReference
                                                    ],
                                                  },
                                                ),
                                              }, callsRecordReference);
                                              if (FFAppState()
                                                      .recentlyCalledUsers.isNotEmpty) {
                                                if (FFAppState()
                                                    .recentlyCalledUsers
                                                    .contains(
                                                        listViewUsersRecord
                                                            .reference)) {
                                                  FFAppState()
                                                      .removeFromRecentlyCalledUsers(
                                                          listViewUsersRecord
                                                              .reference);
                                                  safeSetState(() {});
                                                  FFAppState()
                                                          .recentlyCalledUsers =
                                                      functions
                                                          .addItemAtTopOfList(
                                                              FFAppState()
                                                                  .recentlyCalledUsers
                                                                  .toList(),
                                                              listViewUsersRecord
                                                                  .reference)!
                                                          .toList()
                                                          .cast<
                                                              DocumentReference>();
                                                  safeSetState(() {});
                                                } else {
                                                  FFAppState()
                                                      .addToRecentlyCalledUsers(
                                                          listViewUsersRecord
                                                              .reference);
                                                  safeSetState(() {});
                                                }
                                              } else {
                                                FFAppState()
                                                    .addToRecentlyCalledUsers(
                                                        listViewUsersRecord
                                                            .reference);
                                                safeSetState(() {});
                                              }

                                              await currentUserDocument!
                                                  .userCallManagement!
                                                  .update(
                                                      createUserCallManagementRecordData(
                                                active: true,
                                                incomming: false,
                                                activeCallRef: _model
                                                    .createVideoCall?.reference,
                                                videoCallRequest: true,
                                              ));

                                              await listViewUsersRecord
                                                  .userCallManagement!
                                                  .update(
                                                      createUserCallManagementRecordData(
                                                active: false,
                                                incomming: true,
                                                activeCallRef: _model
                                                    .createVideoCall?.reference,
                                                videoCallRequest: true,
                                              ));
                                              triggerPushNotification(
                                                notificationTitle:
                                                    currentUserDisplayName,
                                                notificationText:
                                                    'Incoming call',
                                                notificationImageUrl:
                                                    currentUserPhoto,
                                                notificationSound: 'default',
                                                userRefs: [
                                                  listViewUsersRecord.reference
                                                ],
                                                initialPageName: 'Call_Screen',
                                                parameterData: {
                                                  'callRef': _model
                                                      .createVideoCall
                                                      ?.reference,
                                                },
                                              );

                                              context.pushNamed(
                                                'Call_Screen',
                                                queryParameters: {
                                                  'callRef': serializeParam(
                                                    _model.createVideoCall
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .scale,
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    duration: Duration(
                                                        milliseconds: 250),
                                                  ),
                                                },
                                              );

                                              _model.startCall = null;
                                              _model.recents = false;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                          ),
                                        if (_model.startCall == null)
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 50.0,
                                            borderWidth: 2.0,
                                            buttonSize: 45.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            icon: Icon(
                                              Icons.call,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              _model.recents = false;
                                              _model.startCall =
                                                  listViewUsersRecord.reference;
                                              safeSetState(() {});
                                              _model.voiceToken =
                                                  await actions.generateToken(
                                                FFAppState().appId,
                                                FFAppState().appCertificate,
                                                '${listViewUsersRecord.displayName}$currentUserDisplayName',
                                                '0',
                                              );

                                              var callsRecordReference =
                                                  CallsRecord.collection.doc();
                                              await callsRecordReference.set({
                                                ...createCallsRecordData(
                                                  userA: currentUserReference,
                                                  userB: listViewUsersRecord
                                                      .reference,
                                                  channelName:
                                                      '${listViewUsersRecord.displayName}$currentUserDisplayName',
                                                  ringing: true,
                                                  callEnded: false,
                                                  callDeclined: false,
                                                  userAJoined: true,
                                                  userBJoined: false,
                                                  callPlacedAt:
                                                      getCurrentTimestamp,
                                                  isVideo: false,
                                                  userAUid:
                                                      functions.generateUserUID(
                                                          currentUserUid),
                                                  userBUid:
                                                      functions.generateUserUID(
                                                          listViewUsersRecord
                                                              .uid),
                                                  videoRequest: false,
                                                  switchedToVideo: false,
                                                  appId: FFAppState().appId,
                                                  tokenId: _model.voiceToken,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'users': [
                                                      currentUserReference
                                                    ],
                                                  },
                                                ),
                                              });
                                              _model.createVoiceCall =
                                                  CallsRecord
                                                      .getDocumentFromData({
                                                ...createCallsRecordData(
                                                  userA: currentUserReference,
                                                  userB: listViewUsersRecord
                                                      .reference,
                                                  channelName:
                                                      '${listViewUsersRecord.displayName}$currentUserDisplayName',
                                                  ringing: true,
                                                  callEnded: false,
                                                  callDeclined: false,
                                                  userAJoined: true,
                                                  userBJoined: false,
                                                  callPlacedAt:
                                                      getCurrentTimestamp,
                                                  isVideo: false,
                                                  userAUid:
                                                      functions.generateUserUID(
                                                          currentUserUid),
                                                  userBUid:
                                                      functions.generateUserUID(
                                                          listViewUsersRecord
                                                              .uid),
                                                  videoRequest: false,
                                                  switchedToVideo: false,
                                                  appId: FFAppState().appId,
                                                  tokenId: _model.voiceToken,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'users': [
                                                      currentUserReference
                                                    ],
                                                  },
                                                ),
                                              }, callsRecordReference);
                                              if (FFAppState()
                                                      .recentlyCalledUsers.isNotEmpty) {
                                                if (FFAppState()
                                                    .recentlyCalledUsers
                                                    .contains(
                                                        listViewUsersRecord
                                                            .reference)) {
                                                  FFAppState()
                                                      .removeFromRecentlyCalledUsers(
                                                          listViewUsersRecord
                                                              .reference);
                                                  safeSetState(() {});
                                                  FFAppState()
                                                          .recentlyCalledUsers =
                                                      functions
                                                          .addItemAtTopOfList(
                                                              FFAppState()
                                                                  .recentlyCalledUsers
                                                                  .toList(),
                                                              listViewUsersRecord
                                                                  .reference)!
                                                          .toList()
                                                          .cast<
                                                              DocumentReference>();
                                                  safeSetState(() {});
                                                } else {
                                                  FFAppState()
                                                      .addToRecentlyCalledUsers(
                                                          listViewUsersRecord
                                                              .reference);
                                                  safeSetState(() {});
                                                }
                                              } else {
                                                FFAppState()
                                                    .addToRecentlyCalledUsers(
                                                        listViewUsersRecord
                                                            .reference);
                                                safeSetState(() {});
                                              }

                                              await currentUserDocument!
                                                  .userCallManagement!
                                                  .update(
                                                      createUserCallManagementRecordData(
                                                active: true,
                                                incomming: false,
                                                activeCallRef: _model
                                                    .createVoiceCall?.reference,
                                              ));

                                              await listViewUsersRecord
                                                  .userCallManagement!
                                                  .update(
                                                      createUserCallManagementRecordData(
                                                active: false,
                                                incomming: true,
                                                activeCallRef: _model
                                                    .createVoiceCall?.reference,
                                              ));
                                              triggerPushNotification(
                                                notificationTitle:
                                                    currentUserDisplayName,
                                                notificationText:
                                                    'Incoming call',
                                                notificationImageUrl:
                                                    currentUserPhoto,
                                                notificationSound: 'default',
                                                userRefs: [
                                                  listViewUsersRecord.reference
                                                ],
                                                initialPageName: 'Call_Screen',
                                                parameterData: {
                                                  'callRef': _model
                                                      .createVoiceCall
                                                      ?.reference,
                                                },
                                              );

                                              context.pushNamed(
                                                'Call_Screen',
                                                queryParameters: {
                                                  'callRef': serializeParam(
                                                    _model.createVoiceCall
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .scale,
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    duration: Duration(
                                                        milliseconds: 250),
                                                  ),
                                                },
                                              );

                                              _model.startCall = null;
                                              _model.recents = false;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                          ),
                                      ].divide(const SizedBox(width: 5.0)),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                  ),
                ]
                    .addToStart(const SizedBox(height: 20.0))
                    .addToEnd(const SizedBox(height: 40.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
