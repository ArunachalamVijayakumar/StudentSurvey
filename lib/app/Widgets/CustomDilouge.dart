import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static void showCustomDialog({
    required String title,
    required String message,
    String buttonText = "OK",
    VoidCallback? onConfirm,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close dialog
              if (onConfirm != null) onConfirm(); // Call additional function if provided
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
