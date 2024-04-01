import 'package:elearning_app/core/class/statusrequest.dart';
import 'package:elearning_app/core/function/handlingdatacontroller.dart';
import 'package:elearning_app/core/services/services.dart';
import 'package:elearning_app/data/datasourse/remote/home_data.dart';
import 'package:elearning_app/data/model/coursemodel.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  // getItems(String categoryid);
  goToCourseDetails(CourseModel courseModel);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  int? id;

  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List courses = [];
  // List items = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Home Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response.containsKey('data')) {
        courses.addAll(response['data']);
        // items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // @override
  // getItems(String categoryid) {
  //   // TODO: implement getItems
  //   throw UnimplementedError();
  // }

  @override
  goToCourseDetails(CourseModel courseModel) {
    Get.toNamed("coursedetails", arguments: {"courseModel": courseModel});
  }
}
