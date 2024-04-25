import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Presentations/Employee/EmployeeSign_up/SignPage.dart';
import 'Presentations/Profile/ProfilePage.dart';
import 'Routes/App_Pages.dart';
import 'Routes/App_Routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCNjzKzrcQWra5xwKDQ-JChqTSt0w6NzTk",
        appId:  "1:400135115599:android:80f49c9bbf49ede17bab3a",
        messagingSenderId: "400135115599",
        projectId: "adacode-8dadf",)
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        initialRoute: AppRoutes.Welcome,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.Lists,
      ),
    );
  }
}