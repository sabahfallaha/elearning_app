import 'package:elearning_app/controller/auth/signup_controller.dart';
import 'package:elearning_app/core/class/handlingdataview.dart';
import 'package:elearning_app/core/constant/color.dart';
import 'package:elearning_app/core/function/alerexitapp.dart';
import 'package:elearning_app/core/function/validinput.dart';
import 'package:elearning_app/view/widget/auth/custombuttomauth.dart';
import 'package:elearning_app/view/widget/auth/customtextbodyauth.dart';
import 'package:elearning_app/view/widget/auth/customtexttitleauth.dart';
import 'package:elearning_app/view/widget/auth/custontextformauth.dart';
import 'package:elearning_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text("Sign Up",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "Welcome Back"),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(
                          text:
                              "Sign Up With Your Email And Password OR Continue With Social Media"),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 20, "username");
                        },
                        mycontroller: controller.username,
                        hinttext: "Enter Your Username",
                        iconData: Icons.person_outline,
                        labeltext: "Username",
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 3, 40, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "Ex: ahmed@gmail.com",
                        iconData: Icons.email_outlined,
                        labeltext: "Email",
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 7, 13, "phone");
                        },
                        mycontroller: controller.phone,

                        hinttext: "Ex: +96399999999",
                        iconData: Icons.phone_android_outlined,
                        labeltext: "Phone",
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
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
                      CustomButtomAuth(
                          text: "Sign Up",
                          onPressed: () {
                            controller.signUp();
                          }),
                      const SizedBox(height: 40),
                      CustomTextSignUpOrSignIn(
                        textone: " have an account? ",
                        texttwo: "SignIn",
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ]),
                  ),
                )),
          )),
    );
  }
}
