import 'package:firebase_auth/firebase_auth.dart';

import '../../../global/common/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String gender,
    String birthdayYear,
    String birthdayMonth,
    String birthdayDay,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update user profile with the first name
      await credential.user?.updateProfile(displayName: firstName);

      // Create a new collection 'users' in Firestore
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Add a new document with a unique ID
      await users.doc(credential.user?.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'birthdayYear': birthdayYear,
        'birthdayMonth': birthdayMonth,
        'birthdayDay': birthdayDay,
        'email': email, // Optionally store the email as well
        // Add other fields as needed
      });

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'The email address is already in use.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }
}
