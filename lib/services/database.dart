import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> UserInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(id)
        .set(UserInfoMap);
  }

  //Checking username and password
  Future<bool> checkUsernameAndPassword(
      String username, String password) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .where('Username', isEqualTo: username)
          .where('Password', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return true; // Username and password match
      } else {
        return false; // Username and/or password do not match
      }
    } catch (e) {
      print('Error checking username and password: $e');
      return false;
    }
  }
  Future<bool> checkNameAndPhoneNumber(
      String name, String phonenumber) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .where('Phone Number', isEqualTo: phonenumber)
          .where('Name', isEqualTo: name)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return true; // Username and password match
      } else {
        return false; // Username and/or password do not match
      }
    } catch (e) {
      print('Error checking username and password: $e');
      return false;
    }
  }
  Future<void> updatePasswordByUsername(String username, String newPassword) async {
  try {
    // Find the user document based on username
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('User')
        .where('Username', isEqualTo: username)
        .get();

    if (querySnapshot.docs.isEmpty) {
      Fluttertoast.showToast(
                              msg:
                                  " User Not Found ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 6,
                              backgroundColor:
                                  Color.fromARGB(255, 218, 13, 13),
                              textColor: Color.fromARGB(255, 253, 253, 253),
                              fontSize: 16.0,
                            );
      throw Exception('User not found');
    }

    // Assuming there is only one document per username
    String userId = querySnapshot.docs[0].id;

    // Update password in the user document
    await FirebaseFirestore.instance.collection('User').doc(userId).update({
      'Password': newPassword,
    });
      Fluttertoast.showToast(
                              msg:
                                  " Password updated successfully ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 6,
                              backgroundColor:
                                  Color.fromARGB(255, 135, 221, 117),
                              textColor: Color.fromARGB(255, 253, 253, 253),
                              fontSize: 16.0,
                            );

    //('Password updated successfully');

  } catch (e) {
   // print('Error updating password: $e');
    Fluttertoast.showToast(
                              msg:
                                  'Error updating password: $e',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 6,
                              backgroundColor:
                                  Color.fromARGB(255, 192, 47, 22),
                              textColor: Color.fromARGB(255, 241, 241, 243),
                              fontSize: 16.0,
                            );
    
  }
}
}
