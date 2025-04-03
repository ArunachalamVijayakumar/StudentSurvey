import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Widgets/CustomDilouge.dart';
import '../controllers/home_controller.dart';

class CustomFAB extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Add Survey Button (Visible when FAB expands)
          if (controller.isFabExpanded.value)
            Padding(
              padding: EdgeInsets.only(bottom: 80, right: 10), // Adjusted for visibility
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
                elevation: 4,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    DialogUtils.showCustomDialog(
                      title: "Feature in Development",
                      message: "The Add Survey feature is currently in development.",
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Add Survey",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.add, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          // Main Floating Action Button
          FloatingActionButton(
            onPressed: controller.isFabExpanded.toggle,
            backgroundColor: Colors.grey[700],
            child: Icon(
              controller.isFabExpanded.value ? Icons.close : Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      );
    });
  }
}
