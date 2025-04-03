import 'dart:math';

import 'package:get/get.dart';

import '../../../Services/StoredService.dart';
import '../../Login/views/login_view.dart';

class HomeController extends GetxController {
  var selectedTabIndex = 0.obs; // Observing tab index
  var isFabExpanded = false.obs; // Controls FAB expansion
  final List<Map<String, dynamic>> surveys = [
    {
      "urn": Random().nextInt(90000) + 10000,
      "name": "Customer Feedback",
      "createdBy": "Admin",
      "assignedTo": "John Doe",
      "commencementDate": "2024-04-05",
      "dueDate": "2024-04-15",
      "institution": "ABC School",
      "status": "Ongoing"
    },
    {
      "urn": Random().nextInt(90000) + 10000,
      "name": "Market Research",
      "createdBy": "Manager",
      "assignedTo": "Jane Smith",
      "commencementDate": "2024-03-20",
      "dueDate": "2024-04-10",
      "institution": "XYZ University",
      "status": "Completed"
    },
  ];


  void changeTab(int index) {
    selectedTabIndex.value = index; // Change tab index
  }

  // Logout user
  Future<void> logout() async {
    await StorageService.logoutUser();
    Get.offAll(LoginView()); // Navigate back to login screen
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
