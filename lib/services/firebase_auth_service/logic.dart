import 'package:cab_express/data/models/core/customer.model.dart';
import 'package:cab_express/data/models/core/driver.model.dart';
import 'package:cab_express/data/models/core/user.model.dart';
import 'package:cab_express/data/models/core/user_auth.model.dart';
import 'package:cab_express/global/cab_constants.dart';
import 'package:cab_express/services/local_storage_service.dart';
import 'package:cab_express/utils/states.dart';
import 'package:cab_express/utils/user_type.enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'state.dart';

class FirebaseAuthServiceLogic extends GetxService {
  static FirebaseAuthServiceLogic get instance => Get.find();
  final FirebaseAuthServiceState state = FirebaseAuthServiceState();
  final _authStates = const States().obs;

  States get authStates => _authStates.value;

  set authStates(States value) => _authStates.value = value;

  Future<void> checkCurrentUserLoggedIn() async {
    print('FirebaseAuthServiceLogic.checkCurrentUserLoggedIn: ABCDEFGHIGK');
    try {
      final user = state.auth.currentUser;
      if (user != null) {
        final result = await fetchUserProfileInformation(user.uid);
        if (result != null) {
          switch (result) {
            case CustomerModel():
              LocalStorageService.instance.customer = result;
              break;
            case DriverModel():
              LocalStorageService.instance.driver = result;
              break;
          }
          authStates = const States(isSuccess: true);
          return;
        }
      }
      authStates = const States(isError: true, messages: 'User not logged in');
    } catch (e, s) {
      authStates = const States(
        isError: true,
        messages: 'Error checking current user',
      );
      print(e);
      print(s);
    }
  }

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
      switch (result) {
        case CustomerModel():
          LocalStorageService.instance.customer = result;
          break;
        case DriverModel():
          LocalStorageService.instance.driver = result;
          break;
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

  Future<BaseUserModel?> fetchUserProfileInformation(
    String? id,
  ) async {
    try {
      final users = state.fireStore.collection(CabConstants.users);
      final userSnapshot = await users.doc(id).get();
      final userData = userSnapshot.data();
      if (userData?['userType'] case int ut) {
        print('FirebaseAuthServiceLogic.fetchUserProfileInformation: $ut');
        return switch (UserType.values[ut]) {
          UserType.customer => CustomerModel.fromMap(userData, id),
          UserType.driver => DriverModel.fromMap(userData, id),
        };
      }
      throw Exception("Invalid user type.");
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }
  Future<void> logout() async {
    try {
      await state.auth.signOut();
      LocalStorageService.instance.removeCustomer();
      LocalStorageService.instance.removeDriver();
      authStates = const States(isSuccess: true);
    } catch (e, s) {
      authStates = const States(
        isError: true,
        messages: 'Error logging out. Please try again.',
      );
      print(e);
      print(s);
    }
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
