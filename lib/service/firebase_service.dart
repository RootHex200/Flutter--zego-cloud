import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_live_streaming_app/model/user_info_model.dart';
import 'package:flutter_live_streaming_app/util/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class FirebaseService {
  final _auth = FirebaseAuth.instance;
  UserInfoModel currentUser = UserInfoModel(uid: "", name: "");
  Future<bool> user_sign_in(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        currentUser = UserInfoModel(
            uid: userCredential.user!.uid, name: userCredential.user!.email!);
        getCurrentUser(userCredential.user!.uid);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
    }
    return false;
  }

  Future<bool> user_sign_up(String email, String password, String name) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        currentUser = UserInfoModel(
            uid: userCredential.user!.uid, name: userCredential.user!.email!);
        User_info_save(userCredential.user!.uid, name);
        getCurrentUser(userCredential.user!.uid);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {}
    } catch (e) {
      print(e);
    }
    return false;
  }

  User_info_save(uid, name) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Allusers');

    await users.add({
      "uid": uid,
      "name": name,
    }).then((value) {

    }).catchError((e) => print(e));
  }

  Stream<List<UserInfoModel>> getAlluser(uid) {
    print("i am here $uid");
    CollectionReference users =
        FirebaseFirestore.instance.collection("Allusers");

    return users.where("uid", isNotEqualTo: uid.toString()).snapshots().map(
        (query) => query.docs
            .map((e) => UserInfoModel.fromDocumentSnapshot(e))
            .toList());
  }

  void getCurrentUser(uid) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Allusers');
    users.where("uid", isEqualTo: uid.toString()).get().then((value) {
      for (var element in value.docs) {
        currentUser = UserInfoModel.fromDocumentSnapshot(element);
            ZegoUIKitPrebuiltCallInvitationService().init(
    appID: Utils.audioappId /*input your AppID*/,
    appSign: Utils.audioappSignin /*input your AppSign*/,
    userID: currentUser.uid,
    userName: currentUser.name,
    plugins: [ZegoUIKitSignalingPlugin()],
  );
      }
    });

  }

  String getUserid() {
    if (_auth.currentUser != null) {
      return _auth.currentUser!.uid;
    }

    return currentUser.uid;
  }
}
