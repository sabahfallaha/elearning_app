import 'package:elearning_app/core/class/statusrequest.dart';
import 'package:elearning_app/core/constant/routes.dart';
import 'package:elearning_app/core/function/handlingdatacontroller.dart';
import 'package:elearning_app/core/services/services.dart';
import 'package:elearning_app/data/datasourse/remote/auth/login.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  // goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // if (response['status'] == "success") {
        if (response.containsKey('access') && response['access'] != "") {
          // data.addAll(response['data']);
          myServices.sharedPreferences.setInt("id", response['id']);
          myServices.sharedPreferences.setString("access", response['access']);
          myServices.sharedPreferences
              .setString("full_name", response['full_name']);
          myServices.sharedPreferences.setString("step", '2');
          print("access: " + "${response['access']}");
          Get.offNamed(AppRoute.homepage);
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              // middleText: "$response");
              middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  // @override
  // goToForgetPassword() {
  //   Get.toNamed(AppRoute.forgetPassword);
  // }
}
