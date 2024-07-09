import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
//   Future<bool> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     // Check if the user signed in successfully
//     if (googleUser != null) {
//       // Navigate to the home page or perform further actions
//       print('Signed in as: ${googleUser.email}');
//       // Navigate to the next screen or perform other logic here
//       return true;
//     } else {
//       // User canceled sign-in process
//       print('Sign in canceled by user.');
//       return false;
//     }
//   } catch (error) {
//     // Handle sign-in errors
//     print('Error signing in: $error');
//     return false;
//   }
// }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      print(userCredential.user);
      return userCredential.user;
    } catch (error) {
      print(" ERROR $error");
    }
  }
}


  // Future<void> signOut() async {
  //   await _auth.signOut();
  //   await _googleSignIn.signOut();
  // }

