import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_survey_app/app/Widgets/CustomDilouge.dart';
import 'package:student_survey_app/app/Widgets/TabbedContentView.dart';
import 'package:student_survey_app/app/modules/Login/views/login_view.dart';
import 'package:student_survey_app/app/modules/surveydetailpage/views/surveydetailpage_view.dart';
import 'package:student_survey_app/app/routes/app_pages.dart';
import '../../../Widgets/TimeAndDate.dart';
import '../controllers/home_controller.dart';
import 'FABMenu.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blueAccent,
        actions: [
          _buildUserButton(), // ✅ User Icon with dropdown menu
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(padding: const EdgeInsets.all(8.0), child: TimeWidget()),
          SizedBox(height: 20),
          // ✅ Add Time & Date Container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabbedContentView(
                tabViews: [
                  ListView.builder(
                    itemCount: controller.surveys.length,
                    itemBuilder: (context, index) {
                      return buildSurveyCard(
                        urn: controller.surveys[index]["urn"],
                        surveyName: controller.surveys[index]["name"],
                        createdBy: controller.surveys[index]["createdBy"],
                        assignedTo: controller.surveys[index]["assignedTo"],
                        commencementDate: controller.surveys[index]["commencementDate"],
                        dueDate: controller.surveys[index]["dueDate"],
                        institution: controller.surveys[index]["institution"],
                        status: controller.surveys[index]["status"],
                      );
                    },
                  ),
                  Center(
                    child: Text(
                      "Completed Surveys View",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Center(
                    child: Text(
                      "With-held Surveys View",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
                tabDataList: [
                  "Scheduled Surveys",
                  "Completed Surveys",
                  "With-held Surveys",
                ],
                onTabSelected: (value) {},
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: CustomFAB(),
    );
  }

  /// ✅ User Button with dropdown menu
  Widget _buildUserButton() {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'Home') {
          Get.offAll(() => HomeView()); // Navigate to Home
        } else if (value == 'Settings') {
          //Get.to(() => SettingsView()); // Navigate to Settings
          DialogUtils.showCustomDialog(
            title: "Feature in Development",
            message: "The Setting feature is currently in development.",
          );
        } else if (value == 'Sign Out') {
          final controller = Get.find<HomeController>();
          controller.logout();
        }
      },
      icon: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://www.w3schools.com/howto/img_avatar.png",
        ), // Replace with user profile image
      ),
      itemBuilder:
          (BuildContext context) => [
            PopupMenuItem(value: 'Home', child: Text('🏠 Home')),
            PopupMenuItem(value: 'Settings', child: Text('⚙ Settings')),
            PopupMenuItem(value: 'Sign Out', child: Text('🚪 Sign Out')),
          ],
    );
  }

  // Tab Button Widget
  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        controller.changeTab(index);
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color:
                    controller.selectedTabIndex.value == index
                        ? Colors.blueAccent
                        : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:
                  controller.selectedTabIndex.value == index
                      ? Colors.blueAccent
                      : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSurveyCard({
    required int urn,
    required String surveyName,
    required String createdBy,
    required String assignedTo,
    required String commencementDate,
    required String dueDate,
    required String institution,
    required String status,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(SurveydetailpageView(), arguments: {
          "urn": urn,
          "name": surveyName,
          "createdBy": createdBy,
          "assignedTo": assignedTo,
          "commencementDate": commencementDate,
          "dueDate": dueDate,
          "institution": institution,
          "status": status,
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("URN: $urn", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
              SizedBox(height: 4),
              Text(surveyName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      DialogUtils.showCustomDialog(
                        title: "Feature in Development",
                        message: "The Start feature is currently in development.",
                      );
                    }, icon: Icon(Icons.play_arrow), label: Text("Start"), style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      DialogUtils.showCustomDialog(
                        title: "Feature in Development",
                        message: "The Edit feature is currently in development.",
                      );
                    }, icon: Icon(Icons.edit), label: Text("Edit"), style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      DialogUtils.showCustomDialog(
                        title: "Feature in Development",
                        message: "The Delete feature is currently in development.",
                      );
                    }, icon: Icon(Icons.delete), label: Text("Delete"), style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
