// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:dio/dio.dart';

class SystemApi {

  Object error = "";
  final AppLink = "https://api.eskanist.com/public/api";
  login({required String email, required String password}) async {
    try {
      final dio = Dio();
      String endpoint = "login";
      var params = {
        "email": email,
        "passsword": password,
      };

      var formData = FormData.fromMap(params);

      final response = await dio.post("$AppLink$endpoint", data: formData);

      if(response.statusCode == 200) {
        var token = response.data["token"];
        return token;
      }
      else {
        return null;
      }
    } catch (e) {
      error = e;
      return null;
    }
  }

  me({required String token}) async {
    try {
      String apiEndpoint = "$AppLink/me";

      final Dio dio = Dio();
      dio.options.headers["authorization"] = "Bearer $token";

      var response = await dio.get(apiEndpoint);
      if (response.statusCode == 200) {
        if (response.data["success"]) {
          var res = response.data;
          return res;
        } else {
          return null;
        }
      } else if (response.statusCode == 404) {
        // wrong user password
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> register(
    {required String email, 
    required  String password, 
    required  String name, 
    required  String phone}) async {
    try {
      final dio = Dio();
      String endpoint = "/register";
      
      var params = {
        "name": name,
        "email": email,
        "passsword": password,
        "confirm_password": password,
      };
      print(params);

      var formData = FormData.fromMap(params);

      final response = await dio.post(endpoint, data: formData);
      print(response);

      if(response.statusCode == 200) {
        var token = response.data["token"];
        return token;
      }
      else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
