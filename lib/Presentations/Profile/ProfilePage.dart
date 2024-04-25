import 'package:adacode/Routes/App_Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Widgets/app_bar/appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              color: Colors.grey,
              height: 250,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 180,
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Account Centre'),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              leading: Icon(Icons.person),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notifications'),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              leading: Icon(Icons.notifications),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Time spent'),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              leading: Icon(Icons.access_time_rounded),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Favorites'),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              leading: Icon(Icons.star_outline),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Account Privacy'),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              leading: Icon(Icons.lock_outline_rounded),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Help'), Icon(Icons.arrow_forward_ios_outlined)],
              ),
              leading: Icon(Icons.help_center_outlined),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('About'),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              leading: Icon(Icons.info_outline),
              onTap: () {},
            ),
            ListTile(
              title: Padding(
                padding:  EdgeInsets.only(left: 30.w),
                child: Row(
                  children: [
                    SizedBox(child: Text('Log out',style: TextStyle(color: Colors.red))),
                  ],
                ),
              ),
              onTap: () {
                Get.toNamed(AppRoutes.Welcome);
              },
            ),
          ],
        ),
      ),
    );
  }
}
