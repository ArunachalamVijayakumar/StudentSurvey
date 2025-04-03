import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:student_survey_app/app/modules/Home/controllers/home_controller.dart';
import 'package:student_survey_app/app/modules/Login/views/login_view.dart';
import 'package:student_survey_app/app/modules/createAccount/controllers/create_account_controller.dart';

import 'app/Services/StoredService.dart';
import 'app/modules/Home/views/home_view.dart';
import 'app/modules/Login/controllers/login_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoginController()); // Initialize the LoginController
  Get.put(HomeController()); // Ensure the controller is available
  Get.put(CreateAccountController()); // Ensure the controller is available
  bool loggedIn = await StorageService.isUserLoggedIn();
  runApp(MyApp(isUserLoggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;
  const MyApp({super.key, required this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student App',
      debugShowCheckedModeBanner: false,
        home: isUserLoggedIn ? HomeView() : LoginView()
    );
  }
}
