import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  AuthService._privateConstructor();

  static final AuthService instance = AuthService._privateConstructor();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  //     ======================= SignOut =======================     //r
  Future<void> userSignOut(BuildContext context) async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }

  //     ======================= Google Sign In =======================     //
  Future<String?> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        log('accessToken --> ${googleSignInAuthentication.accessToken}');
        log('idToken --> ${googleSignInAuthentication.idToken}');

        return googleSignInAuthentication.idToken;
      }
      return null;
    } on FirebaseException catch (e) {
      print('Catch error in Verify User : ${e.message}');
      return null;
    }
  }
}
