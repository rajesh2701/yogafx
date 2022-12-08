import 'package:yogafx/model/model.dart';

class FireStoreDatabase {
  //  ---  USER DETAILS SECTION ---// (){}
  static saveUserInfo(UserModel userModel) async {
    await firebaseFirestore
        .collection('Users')
        .doc(userModel.uid)
        .collection('UserDetails')
        .doc('userInfo')
        .set(userModel.toMap());
  }

  static Future<String> getUserName(String userID) async {
    return await firebaseFirestore
        .collection('Users')
        .doc(userID)
        .collection('UserDetails')
        .doc('userInfo')
        .get()
        .then((value) {
      final userModel = UserModel.fromDocumentSnapshot(doc: value);
      return userModel.userFirstName;
    });
  }
}
