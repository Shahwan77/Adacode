import 'package:adacode/Presentations/Employer/NavBar/NavBarPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../Routes/App_Routes.dart';

class LoginController extends GetxController{
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  RxBool obsecure = true.obs;

  void validateEmail(String value) {
    isEmailValid.value = value.contains('@gmail.com');
  }

  void validatePassword(String value) {
    isPasswordValid.value = value.length >= 7 &&
        value.contains(RegExp(r'[a-z]')) &&
        value.contains(RegExp(r'[A-Z]'));
  }

  void togglePasswordVisibility() {
    obsecure.value = !obsecure.value;
  }

  final password = ''.obs;

  String? ValidatePassword(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailAddressController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final auth = FirebaseAuth.instance;

  void login(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential.user != null) {
          String uid = userCredential.user!.uid;
          DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .get();

          if (userSnapshot.exists) {
            Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
            String storedPassword = userData['password'];

            if (storedPassword == password) {
              Fluttertoast.showToast(msg: "Login Successful");
              Get.to(NavBarPage());
            } else {
              Fluttertoast.showToast(msg: "Incorrect password");
            }
          } else {
            Fluttertoast.showToast(msg: "User not found");
          }
        } else {
          Fluttertoast.showToast(msg: "User authentication failed");
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}