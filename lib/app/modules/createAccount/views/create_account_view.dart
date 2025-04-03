import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/create_account_controller.dart';
import '../../Login/views/login_view.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Name Field
            Obx(() {
              return TextField(
                onChanged: (value) => controller.name.value = value,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  errorText: controller.nameError.value.isEmpty ? null : controller.nameError.value,
                ),
              );
            }),
            const SizedBox(height: 10),

            // Email Field
            Obx(() {
              return TextField(
                onChanged: (value) => controller.email.value = value,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: controller.emailError.value.isEmpty ? null : controller.emailError.value,
                ),
              );
            }),
            const SizedBox(height: 10),

            // Phone Field
            Obx(() {
              return TextField(
                onChanged: (value) => controller.phone.value = value,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  errorText: controller.phoneError.value.isEmpty ? null : controller.phoneError.value,
                ),
              );
            }),
            const SizedBox(height: 10),

            // Password Field
            Obx(() {
              return TextField(
                onChanged: (value) => controller.password.value = value,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: controller.passwordError.value.isEmpty ? null : controller.passwordError.value,
                ),
              );
            }),
            const SizedBox(height: 20),

            // Sign Up Button
            ElevatedButton(
              onPressed: () => controller.createAccount(),
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
