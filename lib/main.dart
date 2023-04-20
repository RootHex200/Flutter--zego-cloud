import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/firebase_options.dart';
import 'package:flutter_live_streaming_app/view/authpage/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//firebase initilized 
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /// 1.1.1 define a navigator key
  final navigatorKey = GlobalKey<NavigatorState>();

  /// 1.1.2: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  runApp( ProviderScope(child: MyApp(navigatorKey: navigatorKey,)));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const MyApp({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zego Audio Video Calling',
      home: const Login_page(),
      navigatorKey: navigatorKey,
    );
  }
}
