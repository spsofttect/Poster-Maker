// ignore_for_file: unused_field

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnalyticsService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirestoreService _firestoreService = locator<FirestoreService>();
 FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: analytics);

  User? _currentUser;
  User get currentUser => _currentUser!;

  // Future loginWithEmail({
  //   String? email,
  //   String? password,
  // }) async {
  //   try {
  //     var authResult = await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email!,
  //       password: password!,
  //     );
  //     await _populateCurrentUser(authResult.user);
  //     return authResult.user != null;
  //   } catch (e) {
  //     return e.message;
  //   }
  // }

  // Future signUpWithEmail({
  //   String? email,
  //   String? password,
  //   String? fullName,
  //   String? role,
  // }) async {
  //   try {
  //     var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: email!,
  //       password: password!,
  //     );

  //     // create a new user profile on firestore
  //     _currentUser = User(
  //       id: authResult.user.uid,
  //       email: email,
  //       fullName: fullName,
  //       userRole: role,
  //     );

  //     await _firestoreService.createUser(_currentUser);
  //     return authResult.user != null;
  //   } catch (e) {
  //     return e.message;
  //   }
  // }

  // Future<bool> isUserLoggedIn() async {
  //   var user = _firebaseAuth.currentUser!;
  //   await _populateCurrentUser(user);
  //   return user != null;
  // }

  // Future _populateCurrentUser(FirebaseUser user) async {
  //   if (user != null) {
  //     _currentUser = await _firestoreService.getUser(user.uid);
  //   }
  // }
}
