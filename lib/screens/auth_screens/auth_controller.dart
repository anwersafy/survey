import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FlipCardController flipCardController = FlipCardController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();

  void flipCard() {
    flipCardController.toggleCard();
    update();
  }
  Future SignIn() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      Get.snackbar('ادخل البيانات بشكل صحيح'  , e.toString());
    }
  }
  // void addUser() async {
  //   UserModel user = UserModel(
  //     email: auth.currentUser?.email,
  //     name: nameController.text,
  //   );
  //   try {
  //     await db.collection('users').doc(auth.currentUser!.uid).collection('info').doc(user.toString()).set({
  //       'name': nameController.text,
  //       'email': emailController.text,
  //     });
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }
// void ResetPassword
void ResetPassword () async {
  try {
    await auth.sendPasswordResetEmail(email: resetPasswordController.text);
  } catch (e) {
    Get.snackbar('Error', e.toString());
  }
}
  Future SignUp() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
  void SignOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
  void DeleteUser() async {
    try {
      await auth.currentUser!.delete();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
  void UpdatePassword() async {
    try {
      await auth.currentUser!.updatePassword(passwordController.text);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
  void UpdateEmail() async {
    try {
      await auth.currentUser!.updateEmail(emailController.text);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
  void UpdateProfile() async {
    try {
      await auth.currentUser!.updateProfile(displayName: nameController.text);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
  void ReloadUser() async {
    try {
      await auth.currentUser!.reload();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
  void SendEmailVerification() async {
    try {
      await auth.currentUser!.sendEmailVerification();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
  void ReauthenticateUser() async {
    try {
      await auth.currentUser!.reauthenticateWithCredential(
          EmailAuthProvider.credential(
              email: emailController.text, password: passwordController.text));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
  void UpdateUser() async {
    try {
      await auth.currentUser!.updateProfile(displayName: nameController.text);
      await auth.currentUser!.updateEmail(emailController.text);
      await auth.currentUser!.updatePassword(passwordController.text);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
