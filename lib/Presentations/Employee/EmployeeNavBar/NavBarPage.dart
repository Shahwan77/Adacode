import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Home/HomePage.dart';
import '../../Profile/ProfilePage.dart';
import '../employeeChats/ChatPage.dart';
import 'Controller/NavBarController.dart';

class employeeNavBarPage extends GetView<employeeNavBarController> {
  const employeeNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      HomePage(),
      // employeeChatScreen(),
      ProfilePage(),
    ];

    return Scaffold(
        body: Obx(() => Pages[controller.selectedIndex.value]),
        bottomNavigationBar: Obx(
              () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              currentIndex: controller.selectedIndex.value,
              onTap: (value) {
                controller.selectedIndex.value = value;
              },
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              selectedItemColor: Colors.deepOrange,
              selectedIconTheme: IconThemeData(color: Colors.deepOrange),
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      controller.selectedIndex.value == 0
                          ? Icons.home
                          : Icons.home_outlined,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      controller.selectedIndex.value == 1
                          ? Icons.person
                          : Icons.person_2_outlined,
                    ),
                    label: 'Profile'),
              ]),
        ));
  }
}