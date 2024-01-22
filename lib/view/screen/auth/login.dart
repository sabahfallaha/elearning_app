import 'package:elearning_app/controller/auth/login_controller.dart';
import 'package:elearning_app/core/constant/color.dart';
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
    LoginControllerImp controller = Get.put(LoginControllerImp());
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const LogoAuth(),
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Welcome Back"),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(
              text:
                  "Sign In With Your Email And Password OR Continue With Social Media"),
          const SizedBox(height: 15),
          CustonTextFormAuth(
            mycontroller: controller.email,
            hinttext: "Enter Your Email",
            iconData: Icons.email_outlined,
            labeltext: "Email",
            // mycontroller: ,
          ),
          CustonTextFormAuth(
            mycontroller: controller.password,
            hinttext: "Enter Your Password",
            iconData: Icons.lock_outline,
            labeltext: "Password",
            // mycontroller: ,
          ),
          const Text(
            "Forget Password",
            textAlign: TextAlign.end,
          ),
          CustomButtomAuth(text: "Sign In", onPressed: () {}),
          const SizedBox(height: 40),
          CustomTextSignUpOrSignIn(
            textone: "Don't have an account ? ",
            texttwo: "SignUp",
            onTap: () {
              controller.goToSignUp();
            },
          )
        ]),
      ),
    );
  }
}
