import 'package:elearning_app/controller/auth/login_controller.dart';
import 'package:elearning_app/core/class/handlingdataview.dart';
import 'package:elearning_app/core/constant/color.dart';
import 'package:elearning_app/core/function/alerexitapp.dart';
import 'package:elearning_app/core/function/validinput.dart';
import 'package:elearning_app/view/widget/auth/custombuttomauth.dart';
import 'package:elearning_app/view/widget/auth/customtextbodyauth.dart';
import 'package:elearning_app/view/widget/auth/customtexttitleauth.dart';
import 'package:elearning_app/view/widget/auth/custontextformauth.dart';
import 'package:elearning_app/view/widget/auth/logoauth.dart';
import 'package:elearning_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const LogoAuth(),
                      const SizedBox(height: 20),

                      CustomTextTitleAuth(text: "Welcome Back"),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(
                          text: "Sign In Your Email And Password"),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          // return validInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "Enter Your Email",
                        iconData: Icons.email_outlined,
                        labeltext: "Email",
                        // mycontroller: ,
                      ),
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          obscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 3, 30, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: "Enter Your Password",
                          iconData: Icons.lock_outline,
                          labeltext: "Password",
                          // mycontroller: ,
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     controller.goToForgetPassword();
                      //   },
                      //   child: Text(
                      //     "14".tr,
                      //     textAlign: TextAlign.right,
                      //   ),
                      // ),
                      CustomButtomAuth(
                          text: "Sign In",
                          onPressed: () {
                            controller.login();
                          }),
                      const SizedBox(height: 40),
                      CustomTextSignUpOrSignIn(
                        textone: "Dont Have An Account? ",
                        texttwo: "Sign Up",
                        onTap: () {
                          controller.goToSignUp();
                        },
                      )
                    ]),
                  ),
                )),
          )),
    );
  }
}
