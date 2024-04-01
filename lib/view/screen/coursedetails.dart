import 'package:elearning_app/controller/coursedetails_controller.dart';
import 'package:elearning_app/core/constant/color.dart';
import 'package:elearning_app/view/widget/coursedetails/topdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CourseDetailsControllerImp controller =
        Get.put(CourseDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColor.secondColor,
            onPressed: () {},
            child: const Text(
              "Add To Cart",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: ListView(children: [
          const TopDetails(),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("${controller.courseModel.courseName}",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: AppColor.black,
                      )),
              const SizedBox(height: 10),
              Text(
                "${controller.courseModel.coursePrice} ",
                style: const TextStyle(
                    color: AppColor.primaryColor, fontSize: 30, height: 1.1),
              ),
              const SizedBox(height: 10),
              Text("${controller.courseModel.courseDescription}",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColor.grey2)),
              const SizedBox(height: 10),
              // Text("Color",
              //     style: Theme.of(context).textTheme.headline1!.copyWith(
              //           color: AppColor.fourthColor,
              //         )),
              // const SizedBox(height: 10),
              // const SubitemsList()
            ]),
          )
        ]));
  }
}
