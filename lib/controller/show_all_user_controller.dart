import 'package:flutter_live_streaming_app/model/user_info_model.dart';
import 'package:flutter_live_streaming_app/service/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showalluserProvider = StreamProvider<List<UserInfoModel>>((ref) async* {
  yield* FirebaseService().getAlluser(FirebaseService().getUserid());
});
