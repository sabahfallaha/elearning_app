import 'package:elearning_app/controller/home_controller.dart';
import 'package:elearning_app/core/class/handlingdataview.dart';
import 'package:elearning_app/data/model/coursemodel.dart';
import 'package:elearning_app/view/widget/customappbar.dart';
import 'package:elearning_app/view/widget/home/customlistcourses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<HomeControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  const CustomAppBar(
                    titleappbar: "الكورسات",
                  ),
                  const SizedBox(height: 20),
                  // const ListCategoriesItems(),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.courses.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, index) {
                        return CustomListCourses(
                            courseModel: CourseModel.fromJson(
                                controller.courses[index]));
                      })
                ]))),
      ),
    );
  }
}
