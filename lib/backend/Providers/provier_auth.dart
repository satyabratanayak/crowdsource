import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class AuthProvider extends ChangeNotifier {
  var month = DateFormat.MMMM().format(DateTime.now());
  var date = DateFormat('dd').format(DateTime.now());
  static var dateAnalytics = DateFormat('dd-MM-yyyy').format(DateTime.now());
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // static Future<bool> isInfluencer() async {
  //   final userInstance = await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).get();
  //   final bool isInf = userInstance.data()!["isInfluencer"];
  //   return isInf;
  // }

  // googlelogin() method is used to handle log in with google log
  Future googleLogIn({required bool isInfluencer}) async {
    final googleUser = await googleSignIn.signIn();

    print("signin");
    if (googleUser == null) return null;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await _firestore
        .collection('Users')
        .doc(uid)
        .set({"uid": uid, "displayName": user.displayName, "email": user.email, "isInfluencer": isInfluencer, "ProfileURL": user.photoUrl});
    notifyListeners();
    // if (isInfluencer) {
    //   await _firestore.collection('Influencer').doc(uid).set({"uid": user.id, "displayName": user.displayName, "email": user.email});
    // } else {
    //   await _firestore.collection('Particiapnts').doc(uid).set({"uid": user.id, "displayName": user.displayName, "email": user.email});
    // }
  }

  Future googleLogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
