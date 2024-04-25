import 'package:adacode/Routes/App_Routes.dart';
import 'package:adacode/Widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Widgets/app_bar/appbar.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/heading.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  txt: 'Welcome',
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
            child: Button(
              text: Text('Employer Login'),
              ontap: () {
                Get.toNamed(AppRoutes.Sign_up);
              },
            ),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              text: Text('Employee Login'),
              ontap: () {
                Get.toNamed(AppRoutes.EmployeeSign_up);
              },
            ),
          ),
        ],
      ),
    );
  }
}
