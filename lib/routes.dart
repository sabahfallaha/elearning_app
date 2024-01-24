import 'package:elearning_app/core/constant/routes.dart';
import 'package:elearning_app/core/middleware/mymiddleware.dart';
import 'package:elearning_app/view/screen/auth/login.dart';
import 'package:elearning_app/view/screen/auth/signup.dart';
import 'package:elearning_app/view/screen/auth/success_signup.dart';
import 'package:elearning_app/view/screen/auth/verifycodesignup.dart';
import 'package:elearning_app/view/screen/home.dart';
import 'package:elearning_app/view/screen/onboarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const OnBoarding(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
];
