import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning_app/controller/home_controller.dart';
import 'package:elearning_app/core/constant/color.dart';
import 'package:elearning_app/data/model/coursemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListCourses extends GetView<HomeControllerImp> {
  final CourseModel courseModel;
  const CustomListCourses({Key? key, required this.courseModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToCourseDetails(courseModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${courseModel.courseId}",
                    child: CachedNetworkImage(
                      // imageUrl: AppLink.imagestItems + "/" + courseModel.courseImage!,
                      imageUrl: courseModel.courseImage!,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(courseModel.courseName!,
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text("Rating 3.5 ", textAlign: TextAlign.center),
                  //     Container(
                  //       alignment: Alignment.bottomCenter,
                  //       height: 22,
                  //       child: Row(
                  //         children: [
                  //           ...List.generate(
                  //               5,
                  //               (index) => Icon(
                  //                     Icons.star,
                  //                     size: 15,
                  //                   ))
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${courseModel.coursePrice} SP",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                    ],
                  ),
                  Row(
                    children: [
                      Text("${courseModel.courseDuration}",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.access_time,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  )
                ]),
          ),
        ));
  }
}
