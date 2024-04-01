import 'package:elearning_app/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToHomePage();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToHomePage() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
