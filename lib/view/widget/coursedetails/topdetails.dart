import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning_app/controller/coursedetails_controller.dart';
import 'package:elearning_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopDetails extends GetView<CourseDetailsControllerImp> {
  const TopDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(color: AppColor.secondColor),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${controller.courseModel.courseId}",
              child: CachedNetworkImage(
                imageUrl: "${controller.courseModel.courseImage!}",
                height: 250,
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}
