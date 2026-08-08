import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> signInWithGoogle() async {
  try {
    // 1. Trigger the Google Authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // If the user cancels the sign-in flow, return null
    if (googleUser == null) return null;

    // 2. Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // 3. Create a new credential for Firebase
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // 4. Sign in to Firebase with the Google credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    print("Error during Google Sign-In: $e");
    return null;
  }
}
