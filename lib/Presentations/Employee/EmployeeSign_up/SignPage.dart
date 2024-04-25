import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Routes/App_Routes.dart';
import '../../../Widgets/app_bar/appbar.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/textfield.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/heading.dart';
import 'Controller/SignupController.dart';

class employeeSignupPage extends StatelessWidget {
  final employeeSignupController signupController = Get.put(employeeSignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: signupController.formKey,
          child: Column(
            children: [
              CustomAppBar(
                title: '',
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image(
                    image: AssetImage("assets/2.png"),
                  ),
                ),
                action: null,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE),
                child: Row(
                  children: [
                    HeadWidget(
                      txt: 'Sign up',
                      clr: Colors.black,
                      fntwei: FontWeight.bold,
                      size: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(5),
                    child: Textfield(
                      suffix: signupController.isNameValid.isTrue
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : null,
                      lbtxt: 'Name',
                      fcsclr: Colors.black,
                      bdrds: 10,
                      isValid: signupController.isNameValid.value,
                      obsecuretext: false,
                      onchange: (value) {
                        signupController.validateName(value);
                      },
                      validator: (value) {
                        RegExp regex =
                            new RegExp(r'^.{3,}$'); //entering minimum value 3
                        if (value!.isEmpty) {
                          return ("User Name Is Required");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid User Name (Min. 3 Characters)");
                        }
                        return null;
                      },
                      on_saveds: (value) {
                        signupController.userNameController.text = value!;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(5),
                    child: Textfield(
                      controller: signupController.emailAddressController,
                      suffix: signupController.isEmailValid.isTrue
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : null,
                      lbtxt: 'Email',
                      fcsclr: Colors.black,
                      bdrds: 10,
                      isValid: signupController.isEmailValid.value,
                      obsecuretext: false,
                      onchange: (value) {
                        signupController.validateEmail(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        //reg exression for email validation
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter valid Email");
                        }
                        return null;
                      },
                      on_saveds: (value) {
                        signupController.emailAddressController.text = value!;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(5),
                    child: Textfield(
                      controller: signupController.passwordController,
                      valid: AutovalidateMode.onUserInteraction,
                      onchange: (value) {
                        signupController.validatePassword(value);
                        if (value.length > 6) {
                          signupController.isPasswordMatchError.value = false;
                        }
                      },
                      lbtxt: 'Password',
                      suffix: GestureDetector(
                        onTap: () {
                          signupController.togglePasswordVisibility();
                        },
                        child: Icon(
                          signupController.obsecure.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                          color: Colors.green,
                        ),
                      ),
                      fcsclr: Colors.blue,
                      bdrds: 10,
                      obsecuretext: signupController.obsecure.value,
                      isValid: signupController.isPasswordValid.value,
                      validator: (value) {
                        if (value != null && !value.contains(RegExp(r'[Aa]'))) {
                          return "Password must contain 'Aa'";
                        }
                        return null;
                      },
                      on_saveds: (value) {
                        signupController.confirmPasswordController.text = value!;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.EmployeeLog_In);
                        },
                        child: Text('Already have an account? ')),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Button(
                text: Text('SIGN UP'),
                ontap: () {
                  signupController.signUp(
                      signupController.emailAddressController.text,
                      signupController.passwordController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
