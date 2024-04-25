import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../Data/Model_Class/model.dart';
import '../../../../Routes/App_Routes.dart';

class SignupController extends GetxController {
  var isNameValid = false.obs;
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  final isPasswordMatchError = false.obs;
  RxBool obsecure = true.obs;

  void validateName(String value) {
    isNameValid.value = value.isNotEmpty;
  }

  void validateEmail(String value) {
    isEmailValid.value = value.contains('@gmail.com');
  }

  void validatePassword(String value) {
    isPasswordValid.value = value.length >= 7 &&
        value.contains(RegExp(r'[a-z]')) &&
        value.contains(RegExp(r'[A-Z]')) &&
        value.contains(RegExp(r'[Aa]'));
  }

  void togglePasswordVisibility() {
    obsecure.toggle();
  }
  final password = ''.obs;

  String? ValidatePassword(String value) {
    if (value.length < 7) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final userNameController = new TextEditingController();
  final emailAddressController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();

  void signUp(String email, String password) async {
    if (formKey.currentState!.validate()) {
      print('object');
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
      postDetailToFirestore(),
        Fluttertoast.showToast(msg: "Signin  Successfull"),
        Get.toNamed(AppRoutes.NavBar),
      })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  Future<void> postDetailToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        UserModel userModel = UserModel(
          emailAddress: user.email ?? '',
          uid: user.uid,
          userName: emailAddressController.text,
          password: passwordController.text,
        );

        await firebaseFirestore
            .collection("users")
            .doc(user.uid)
            .set(userModel.toMap());

        Fluttertoast.showToast(msg: "Account Created Successfully !");
        Get.toNamed(AppRoutes.Chats);
      } catch (e) {
        Fluttertoast.showToast(msg: "Error: $e");
        print("Error posting data to Firestore: $e");
      }
    } else {
      Fluttertoast.showToast(msg: "User not authenticated");
      print("User not authenticated");
    }
  }

}