// lib/screens/login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_survey_app/app/modules/createAccount/views/create_account_view.dart';
import 'package:student_survey_app/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the controller directly using GetView
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView( // Allow scrolling when the keyboard appears
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16, bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ensure column adjusts to content
            children: [
              Image.asset("asset/images/survey.jpg", fit: BoxFit.cover),
              SizedBox(height: 20),

              // Email TextField
              Obx(() {
                return TextField(
                  keyboardType: TextInputType.emailAddress, // Ensure keyboard appears
                  textInputAction: TextInputAction.next, // Move to next field on enter
                  onChanged: (value) {
                    controller.email.value = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    errorText: controller.emailError.value.isEmpty
                        ? null
                        : controller.emailError.value,
                  ),
                  style: TextStyle(color: Colors.white),
                );
              }),

              SizedBox(height: 20),

              // Password TextField
              Obx(() {
                return TextField(
                  keyboardType: TextInputType.text,
                  obscureText: !controller.isPasswordVisible.value,
                  onChanged: (value) {
                    controller.password.value = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    errorText: controller.passwordError.value.isEmpty
                        ? null
                        : controller.passwordError.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.isPasswordVisible.value =
                        !controller.isPasswordVisible.value;
                      },
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                );
              }),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent, // Light pink color
                  minimumSize: Size(double.infinity, 50), // Full width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded shape
                  ),
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 12),

              // Create Account Button
              ElevatedButton(
                onPressed: () {
                 Get.to(CreateAccountView());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Dark background
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Create an account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 12),

              // Forgot Password
              TextButton(
                onPressed: () {
                  print("Recover password clicked");
                },
                child: Text(
                  'Forgot password? Recover',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
