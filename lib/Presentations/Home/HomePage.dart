import 'package:adacode/Presentations/Employer/Chats/ChatPage.dart';
import 'package:adacode/Routes/App_Routes.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Widgets/app_bar/appbar.dart';
import '../Employee/employeeChats/ChatPage.dart';
import 'Controller/HomeController.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              action: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.w),
                    child: GestureDetector(
                        onTap: () {
                          Get.to(employeeChatScreen());
                        },
                        child: Icon(Icons.chat_outlined, size: 20.h)),
                  )
                ],
              ),
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: GetBuilder<HomeController>(
                builder: (_) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                    items: homeController.imageList.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              color: Colors.white60,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Text("Staff attendance"),
                      tileColor: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Text("Staff Details"),
                      tileColor: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Text("Project details"),
                      tileColor: Colors.orange,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Text("Subjects"),
                      tileColor: Colors.red,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
