import 'package:elearning_app/core/class/crud.dart';
import 'package:elearning_app/linkapi.dart';

class CourseData {
  Crud crud;
  CourseData(this.crud);
  getData(String id, String courseid) async {
    var response = await crud.postData(AppLink.coursepage + courseid, {});
    return response.fold((l) => l, (r) => r);
  }
}
