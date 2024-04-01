import 'package:elearning_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;

  const CustomAppBar({
    Key? key,
    required this.titleappbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
          child: AppBar(
            backgroundColor: AppColor.grey,
            elevation: 2,
            centerTitle: true,
            title: Text(
              titleappbar,
              style: const TextStyle(
                color: AppColor.black,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
