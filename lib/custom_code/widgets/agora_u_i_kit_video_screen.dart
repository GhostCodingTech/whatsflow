// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:agora_uikit/agora_uikit.dart';
import 'package:keep_screen_on/keep_screen_on.dart';

class AgoraUIKitVideoScreen extends StatefulWidget {
  const AgoraUIKitVideoScreen({
    super.key,
    this.width,
    this.height,
    required this.appId,
    required this.channelName,
    required this.tokenId,
    required this.username,
    this.endCallAction,
  });

  final double? width;
  final double? height;
  final String appId;
  final String channelName;
  final String tokenId;
  final String username;
  final Future Function()? endCallAction;

  @override
  State<AgoraUIKitVideoScreen> createState() => _AgoraUIKitVideoScreenState();
}

class _AgoraUIKitVideoScreenState extends State<AgoraUIKitVideoScreen> {
  late AgoraClient client;

  @override
  void initState() {
    super.initState();

    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: widget.appId,
        channelName: widget.channelName,
        username: widget.username,
        tempToken: widget
            .tokenId, // Adjust the parameter name according to the package documentation
        uid: 0,
      ),
    );
    initAgora();
    KeepScreenOn.turnOn();
  }

  @override
  void dispose() {
    // Turn off the keep screen on functionality when leaving the screen
    KeepScreenOn.turnOff();
    super.dispose();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          AgoraVideoViewer(
            client: client,
            layoutType: Layout.oneToOne,
            enableHostControls: true, // Add this to enable host controls
          ),
          AgoraVideoButtons(
            client: client,
            addScreenSharing: true,
            enabledButtons: [
              BuiltInButtons.callEnd,
              BuiltInButtons.switchCamera,
              BuiltInButtons.toggleCamera,
              BuiltInButtons.toggleMic,
              BuiltInButtons.screenSharing,
            ],
            onDisconnect: () async {
              client.engine.leaveChannel();
              if (widget.endCallAction != null) {
                await widget.endCallAction!();
              }
            },
          ),
        ],
      ),
    );
  }
}
