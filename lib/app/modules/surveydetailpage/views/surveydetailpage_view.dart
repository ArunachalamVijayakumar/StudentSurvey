import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/surveydetailpage_controller.dart';

class SurveydetailpageView extends GetView<SurveydetailpageController> {
  const SurveydetailpageView({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> survey = Get.arguments; // Get passed data

    return Scaffold(
      appBar: AppBar(
        title: Text("Survey Details"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("URN: ${survey['urn']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
              SizedBox(height: 10),
              Text("Survey Name: ${survey['name']}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("Created By: ${survey['createdBy']}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("Assigned To: ${survey['assignedTo']}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("Commencement Date: ${survey['commencementDate']}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("Due Date: ${survey['dueDate']}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("Institution: ${survey['institution']}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("Status: ${survey['status']}", style: TextStyle(fontSize: 16, color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
