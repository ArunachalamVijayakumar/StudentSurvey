import 'package:get/get.dart';

import '../controllers/surveydetailpage_controller.dart';

class SurveydetailpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveydetailpageController>(
      () => SurveydetailpageController(),
    );
  }
}
