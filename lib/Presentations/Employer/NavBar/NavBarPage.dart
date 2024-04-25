import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Home/HomePage.dart';
import '../../Profile/ProfilePage.dart';
import '../Chats/ChatPage.dart';
import '../EmployerHome/HomePage.dart';
import 'Controller/NavBarController.dart';

class NavBarPage extends GetView<NavBarController> {
   NavBarPage({super.key});
final NavBarController navBarController = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      EmployerHomePage(),
      // ChatScreen(),
      ProfilePage(),
    ];

    return Scaffold(
        body: Obx(() => Pages[navBarController.selectedIndex.value]),
        bottomNavigationBar: Obx(
              () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              currentIndex: navBarController.selectedIndex.value,
              onTap: (value) {
                navBarController.selectedIndex.value = value;
              },
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              selectedItemColor: Colors.deepOrange,
              selectedIconTheme: IconThemeData(color: Colors.deepOrange),
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      navBarController.selectedIndex.value == 0
                          ? Icons.home
                          : Icons.home_outlined,
                    ),
                    label: 'Home'),

                BottomNavigationBarItem(
                    icon: Icon(
                      navBarController.selectedIndex.value == 1
                          ? Icons.person
                          : Icons.person_2_outlined,
                    ),
                    label: 'Profile'),
              ]),
        ));
  }
}