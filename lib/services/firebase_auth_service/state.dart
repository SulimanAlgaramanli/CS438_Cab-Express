import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthServiceState {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  FirebaseAuthServiceState() {
    ///Initialize variables
  }
}
