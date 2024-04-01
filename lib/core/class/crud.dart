import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:elearning_app/core/class/statusrequest.dart';
import 'package:elearning_app/core/function/checkinternet.dart';
import 'package:elearning_app/core/services/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Crud {
  Map<String, String> headers = {};

  MyServices myServices = Get.find();

  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      if (myServices.sharedPreferences.getString("access") != "") {
        headers.addAll({
          'Authorization':
              'Bearer ${myServices.sharedPreferences.getString("access")}'
        });
        print("header:");
        print(headers);
      }
      var response = await http.get(Uri.parse(linkurl), headers: headers);
      print("link: ");
      print(linkurl);
      if (linkurl.contains("login") || linkurl.contains("signup")) {
        print("contains");
        response =
            await http.post(Uri.parse(linkurl), body: data, headers: headers);
        print(response);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
