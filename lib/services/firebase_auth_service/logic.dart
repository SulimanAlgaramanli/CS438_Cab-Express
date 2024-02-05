import 'package:cab_express/data/models/core/customer.model.dart';
import 'package:cab_express/data/models/core/user_auth.model.dart';
import 'package:cab_express/global/cab_constants.dart';
import 'package:cab_express/utils/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'state.dart';

class FirebaseAuthServiceLogic extends GetxService {
  static FirebaseAuthServiceLogic get instance => Get.find();
  final FirebaseAuthServiceState state = FirebaseAuthServiceState();
  final _authStates = const States().obs;

  States get authStates => _authStates.value;

  set authStates(States value) => _authStates.value = value;

  Future<void> signUpWithEmailAndPassword(UserAuthModel userAuth) async {
    if (authStates.isLoading) return;
    authStates = const States(isLoading: true);
    try {
      print(userAuth.toNewUserJson());
      final userCredential = await state.auth.createUserWithEmailAndPassword(
        email: userAuth.email!,
        password: userAuth.password!,
      );
      final result = await saveUserProfileInfo(
        userAuth.copyWith(id: userCredential.user?.uid),
      );
      if (result != null) {
        throw Exception(result);
      }
      authStates = const States(isSuccess: true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        authStates = const States(
          isError: true,
          messages: 'The password provided is too weak.',
        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        authStates = const States(
          isError: true,
          messages: 'The account already exists for that email.',
        );
        print('The account already exists for that email.');
      }
    } catch (e, s) {
      authStates = const States(
        isError: true,
        messages: 'Something went wrong. Please try again',
      );
      print(e);
      print(s);
    }
  }

  Future<void> loginWithEmailAndPassword(UserAuthModel userAuth) async {
    if (authStates.isLoading) return;
    authStates = const States(isLoading: true);
    try {
      print(userAuth.toNewUserJson());
      final userCredential = await state.auth.signInWithEmailAndPassword(
        email: userAuth.email!,
        password: userAuth.password!,
      );
      final result = await fetchUserProfileInformation(
        userCredential.user?.uid,
      );
      if (result == null) {
        throw Exception(
            'Something is wrong with the user profile information.');
      }
      LocalStorageService.instance.customer = result;
      authStates = const States(isSuccess: true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        authStates = const States(
          isError: true,
          messages: 'The password provided is too weak.',
        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        authStates = const States(
          isError: true,
          messages: 'The account already exists for that email.',
        );
        print('The account already exists for that email.');
      }
    } catch (e, s) {
      authStates = const States(
        isError: true,
        messages: 'Something went wrong. Please try again',
      );
      print(e);
      print(s);
    }
  }

  Future<String?> saveUserProfileInfo(UserAuthModel userAuth) async {
    try {
      final users = state.fireStore.collection(CabConstants.users);
      print(
        'FirebaseAuthServiceLogic.saveUserProfileInfo: data = ${userAuth.toNewUserJson()}',
      );
      await users.doc(userAuth.id).set(userAuth.toNewUserJson());

      return null;
    } catch (e, s) {
      print(e);
      print(s);
      return "$e";
    }
  }

  Future<CustomerModel?> fetchUserProfileInformation(
    String? id,
  ) async {
    try {
      final users = state.fireStore.collection(CabConstants.users);
      final userSnapshot = await users.doc(id).get();
      final userSnapData = userSnapshot.data();
      return CustomerModel.fromMap(userSnapData, id);
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
