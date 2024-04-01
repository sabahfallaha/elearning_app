import 'dart:convert';

class CourseModel {
  int? courseId;
  String? courseName;
  String? courseDescription;
  double? coursePrice;
  double? courseDuration;
  String? courseImage;

  CourseModel(
      {this.courseId,
      this.courseName,
      this.courseDescription,
      this.courseDuration,
      this.courseImage,
      this.coursePrice});

  CourseModel.fromJson(Map<String, dynamic> json) {
    courseId = json['id'];
    // courseName = json['name'];
    courseName = utf8.decode(json['name'].runes.toList());
    courseImage = json['Image'];
    // courseDescription = json['description'];
    courseDescription = utf8.decode(json['description'].runes.toList());
    courseDuration = json['Duration'];
    coursePrice = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = courseId;
    data['name'] = this.courseName;
    data['Image'] = this.courseImage;
    data['description'] = this.courseDescription;
    data['Duration'] = this.courseDuration;
    data['price'] = this.coursePrice;
    return data;
  }
}
