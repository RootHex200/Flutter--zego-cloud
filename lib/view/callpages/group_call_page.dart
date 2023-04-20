import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/util/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class GroupCallPage extends StatelessWidget {
  final String callId;
  final String userID;
  final String userName;
  const GroupCallPage({super.key, required this.callId, required this.userID,required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ZegoUIKitPrebuiltCall(
            appID: Utils.videoappId,
            appSign: Utils.videoappSignin,
            callID: callId,
            userID: userID,
            userName: userName,
            config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
            ),
      ),
    );
  }
}