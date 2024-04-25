import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../Routes/App_Routes.dart';
import '../../../Widgets/app_bar/appbar.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/textfield.dart';
import '../../../core/Constants/imageconstants.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/heading.dart';
import 'Controller/LoginController.dart';

class employeeLoginPage extends StatelessWidget {
  final employeeLoginController loginController =
      Get.put(employeeLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: loginController.formKey,
          child: Column(
            children: [
              CustomAppBar(
                title: '',
                leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image(image: AssetImage("assets/2.png"))),
                action: null,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE),
                child: Row(
                  children: [
                    HeadWidget(
                      txt: 'Login',
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
                      controller: loginController.emailAddressController,
                      suffix: loginController.isEmailValid.isTrue
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : null,
                      lbtxt: 'Email',
                      fcsclr: Colors.black,
                      bdrds: 10,
                      isValid: loginController.isEmailValid.value,
                      obsecuretext: false,
                      onchange: (value) {
                        loginController.validateEmail(value);
                      },
                      on_saveds: (value) {
                        loginController.emailAddressController.text = value!;
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
                      controller: loginController.passwordController,
                      valid: AutovalidateMode.onUserInteraction,
                      onchange: (value) {
                        loginController.validatePassword(value);
                      },
                      lbtxt: 'Password',
                      suffix: GestureDetector(
                        onTap: () {
                          loginController.togglePasswordVisibility();
                        },
                        child: Icon(
                          loginController.obsecure.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                          color: Colors.green,
                        ),
                      ),
                      fcsclr: Colors.blue,
                      bdrds: 10,
                      obsecuretext: loginController.obsecure.value,
                      isValid: loginController.isPasswordValid.value,
                      on_saveds: (value) {
                        loginController.passwordController.text = value!;
                      },
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       GestureDetector(
              //           onTap: () {},
              //           child: Text('Forgot Your Password? ')),
              //       Image(image: AssetImage(ImageConstants.arrow))
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 20.h,
              ),
              Button(
                text: Text('LOGIN'),
                ontap: () {
                  loginController.login(
                    loginController.emailAddressController.text,
                    loginController.passwordController.text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
