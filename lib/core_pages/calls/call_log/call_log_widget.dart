import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/call_notifications_nav/call_notifications_nav_widget.dart';
import '/components/chats_notifications_stack/chats_notifications_stack_widget.dart';
import '/components/incomming_call_box/incomming_call_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'call_log_model.dart';
export 'call_log_model.dart';

class CallLogWidget extends StatefulWidget {
  const CallLogWidget({super.key});

  @override
  State<CallLogWidget> createState() => _CallLogWidgetState();
}

class _CallLogWidgetState extends State<CallLogWidget> {
  late CallLogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallLogModel());

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: Align(
          alignment: const AlignmentDirectional(1.0, 0.7),
          child: FloatingActionButton(
            onPressed: () async {
              context.pushNamed(
                'New_Call_Page',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.bottomToTop,
                    duration: Duration(milliseconds: 250),
                  ),
                },
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).fabButton,
            elevation: 8.0,
            child: Icon(
              Icons.add_call,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 24.0,
            ),
          ),
        ),
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
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Calls',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.photo_camera_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.more_vert,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ].addToEnd(const SizedBox(width: 10.0)),
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

                            final columnUserCallManagementRecord =
                                snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (columnUserCallManagementRecord.incomming)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
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
                                    ]
                                        .addToStart(const SizedBox(width: 10.0))
                                        .addToEnd(const SizedBox(width: 10.0)),
                                  ),
                                if (!columnUserCallManagementRecord.incomming)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .searchBox,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController,
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textController',
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          'Ask Flow AI or search for a call',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    validator: _model
                                                        .textControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              if (_model.textController.text !=
                                                      '')
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.search_off_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    safeSetState(() {
                                                      _model.textController
                                                          ?.clear();
                                                    });
                                                  },
                                                ),
                                            ]
                                                .addToStart(
                                                    const SizedBox(width: 10.0))
                                                .addToEnd(
                                                    const SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ]
                                  .divide(const SizedBox(height: 5.0))
                                  .addToStart(const SizedBox(height: 10.0)),
                            );
                          },
                        ),
                      ),
                    ].addToStart(const SizedBox(height: 40.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<CallsRecord>>(
                stream: queryCallsRecord(
                  queryBuilder: (callsRecord) => callsRecord
                      .where(
                        'users',
                        arrayContains: currentUserReference,
                      )
                      .orderBy('call_placed_at', descending: true),
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
                  List<CallsRecord> listViewCallsRecordList = snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewCallsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewCallsRecord =
                          listViewCallsRecordList[listViewIndex];
                      return StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(
                            listViewCallsRecord.userA == currentUserReference
                                ? listViewCallsRecord.userB!
                                : listViewCallsRecord.userA!),
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

                          final containerUsersRecord = snapshot.data!;

                          return Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          width: 2.0,
                                        ),
                                      ),
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
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            width: 0.25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            containerUsersRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            dateTimeFormat(
                                                "relative",
                                                listViewCallsRecord
                                                    .callPlacedAt!),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 9.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              listViewCallsRecord.userA ==
                                                      currentUserReference
                                                  ? 'Outgoing'
                                                  : 'Incoming',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              if ((listViewCallsRecord.userA ==
                                                      currentUserReference) &&
                                                  !listViewCallsRecord
                                                      .callDeclined)
                                                Icon(
                                                  Icons.call_made,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                              if ((listViewCallsRecord.userA !=
                                                      currentUserReference) &&
                                                  !listViewCallsRecord
                                                      .callDeclined)
                                                Icon(
                                                  Icons.call_received,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 24.0,
                                                ),
                                              if ((listViewCallsRecord.userA ==
                                                      currentUserReference) &&
                                                  listViewCallsRecord
                                                      .callDeclined)
                                                const Icon(
                                                  Icons.call_missed_sharp,
                                                  color: Color(0xFFFF0717),
                                                  size: 24.0,
                                                ),
                                              if ((listViewCallsRecord.userA !=
                                                      currentUserReference) &&
                                                  listViewCallsRecord
                                                      .callDeclined)
                                                const Icon(
                                                  Icons.phone_callback,
                                                  color: Color(0xFFFF0717),
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                                  .divide(const SizedBox(width: 8.0))
                                  .addToStart(const SizedBox(width: 15.0))
                                  .addToEnd(const SizedBox(width: 15.0)),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Material(
              color: Colors.transparent,
              elevation: 2.0,
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0xFF0B1E0F),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                      spreadRadius: 2.0,
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'Chat_Home_Page',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: wrapWithModel(
                                      model:
                                          _model.chatsNotificationsStackModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const ChatsNotificationsStackWidget(),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Chats',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(),
                              child: Icon(
                                Icons.camera_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Updates',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(),
                              child: Icon(
                                Icons.groups_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Communities',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .selectedBackGround,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.callNotificationsNavModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: const CallNotificationsNavWidget(),
                                ),
                              ),
                            ),
                            Text(
                              'Calls',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ].divide(const SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
