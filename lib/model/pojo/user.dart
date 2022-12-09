import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String userEmail;
  String userFirstName;
  //String userLastName;
  int userAge;
  String userCountry;
  String userRegion;
  bool isUserMale;

  UserModel(
      {required this.uid,
      required this.userEmail,
      required this.userFirstName,
     // required this.userLastName,
      required this.userAge,
      required this.userCountry,
      required this.userRegion,
      required this.isUserMale});

  UserModel.fromJson(Map<dynamic, dynamic> json)
      : uid = json['uid'] as String,
        userEmail = json['userEmail'] as String,
        userFirstName = json['userFirstName'] as String,
        //userLastName = json['userLastName'] as String,
        userAge = json['userAge'] as int,
        userCountry = json['userCountry'] as String,
        userRegion = json['userRegion'] as String,
        isUserMale = json['isUserMale'] as bool;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'uid': uid,
        'userEmail': userEmail,
        'userFirstName': userFirstName,
        //'userLastName': userLastName,
        'userAge': userAge,
        'userCountry': userCountry,
        'userRegion': userRegion,
        'isUserMale': isUserMale
      };

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userEmail': userEmail,
      'userFirstName': userFirstName,
      //'userLastName': userLastName,
      'userAge': userAge,
      'userCountry': userCountry,
      'userRegion': userRegion,
      'isUserMale': isUserMale
    };
  }

  factory UserModel.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return UserModel(
        uid: doc.data()!['uid'],
        userEmail: doc.data()!['userEmail'],
        userFirstName: doc.data()!['userFirstName'],
        //userLastName: doc.data()!['userLastName'],
        userAge: doc.data()!['userAge'],
        userCountry: doc.data()!['userCountry'],
        userRegion: doc.data()!['userRegion'],
        isUserMale: doc.data()!['isUserMale']);
  }
}
