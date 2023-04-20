import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoModel {
  final String uid;
  final String name;
  final String? Id;
  UserInfoModel({
    required this.uid,
    required this.name,
    this.Id,
  });

  factory UserInfoModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserInfoModel(
      uid: doc['uid'],
      name: doc['name'],
      Id: doc.id,
    );
  }
  
}
