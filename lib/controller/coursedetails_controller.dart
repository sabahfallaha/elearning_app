import 'package:elearning_app/core/class/statusrequest.dart';
import 'package:elearning_app/core/function/handlingdatacontroller.dart';
import 'package:elearning_app/data/datasourse/remote/course_data.dart';
import 'package:elearning_app/data/model/coursemodel.dart';
import 'package:elearning_app/data/model/sectionmodel.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

abstract class CourseDetailsController extends GetxController {
  initialData();
  getdata();
  goToSectionDetails(SectionModel sectioModel);
}

class CourseDetailsControllerImp extends CourseDetailsController {
  late CourseModel courseModel;
  CourseData coursedata = CourseData(Get.find());
  late StatusRequest statusRequest;
  // List courses = [];
  List sections = [];

  @override
  initialData() {
    courseModel = Get.arguments['coursemodel'];
  }

  @override
  void onInit() {
    initialData();

    getdata();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await coursedata.getData(courseModel.courseId.toString());
    print(
        "=============================== Course details Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response.containsKey('data')) {
        // courses.addAll(response['data']);
        sections.addAll(response['data']['sections']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // const Channel = MethodChannel('com.example.getmac');
    // String mac = await Channel.invokeMethod('getMAC');

    // print("mac: ");
    // print(mac);
    update();
  }

  @override
  goToSectionDetails(SectionModel sectionModel) {
    Get.toNamed("sectiondetails", arguments: {"sectionmodel": sectionModel});
  }
}
