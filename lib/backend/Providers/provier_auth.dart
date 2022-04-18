// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:intl/intl.dart';

// class AuthProvider extends ChangeNotifier {
//   var month = DateFormat.MMMM().format(DateTime.now());
//   var date = DateFormat('dd').format(DateTime.now());
//   static var dateAnalytics = DateFormat('dd-MM-yyyy').format(DateTime.now());
//   final googleSignIn = GoogleSignIn();
//   GoogleSignInAccount? _user;
//   // GoogleSignInAccount get user => _user!;

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   UserCredential? _usercred;
//   User get user => _usercred!.user!;

//   // Future<String> getScreenLock() async {
//   //   DocumentSnapshot docRef = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).get();
//   //   final doc = docRef.data() as Map<String, dynamic>;
//   //   return doc['screenLock'];
//   // }

//   // // Id pass Sign Up user
//   // Future<String> signUpUser({
//   //   required String userId,
//   //   required String password,
//   //   required String screenLock,
//   //   required bool serviceLock,
//   // }) async {
//   //   String res = "Some error occured";
//   //   try {
//   //     _usercred = await _auth.createUserWithEmailAndPassword(email: userId, password: password);
//   //     await _firestore.collection("Users").doc(user.uid).set({
//   //       "userId": userId,
//   //       "password": password,
//   //       "screenLock": screenLock,
//   //       "serviceLock": serviceLock,
//   //     });
//   //     await _firestore
//   //         .collection("Users")
//   //         .doc(user.uid)
//   //         .collection("TotalAnalytics")
//   //         .doc(month)
//   //         .set(Analytics(entries: 0, revenue: 0, cash: 0, upi: 0, card: 0, date: dateAnalytics).toJson());
//   //     await _firestore
//   //         .collection("Users")
//   //         .doc(user.uid)
//   //         .collection("TotalAnalytics")
//   //         .doc(month)
//   //         .collection("Dates")
//   //         .doc(date)
//   //         .set(Analytics(entries: 0, revenue: 0, cash: 0, upi: 0, card: 0, date: dateAnalytics).toJson());

//   //     res = "Success";
//   //   } catch (err) {
//   //     res = err.toString();
//   //   }
//   //   return res;
//   // }

//   // // Id Pass Log In User
//   // Future<String> logInUser({
//   //   required String userId,
//   //   required String password,
//   // }) async {
//   //   String res = "Some error occured";
//   //   try {
//   //     await _auth.signInWithEmailAndPassword(email: userId, password: password);
//   //     res = "Success";
//   //   } catch (err) {
//   //     res = err.toString();
//   //   }
//   //   return res;
//   // }

//   // googlelogin() method is used to handle log in with google log
//   Future googleLogIn() async {
//     final googleUser = await googleSignIn.signIn();
//     if (googleUser == null) return null;
//     _user = googleUser;

//     final googleAuth = await googleUser.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     _usercred = await _auth.signInWithCredential(credential);
//     await _firestore.collection('Users').doc(user.uid).set({"uid": user.uid, "displayName": user.displayName, "email": user.email});
//     notifyListeners();
//   }

//   Future<String> saveUserCred() async {
//     var res = 'some error occured';
//     try {
//       if (_usercred != null) {
//         await _firestore.collection('Users').doc(user.uid).set({"uid": user.uid, "displayName": user.displayName, "email": user.email});
//         res = 'Success';
//       }
//     } catch (e) {
//       res = e.toString();
//     }
//     return res;
//   }

//   Future googleLogout() async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }

//   Future signOut() async {
//     FirebaseAuth.instance.signOut();
//   }
// }
