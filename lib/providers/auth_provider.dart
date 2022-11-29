import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_adopt_app/client.dart';

class AuthProvider extends ChangeNotifier {
  String? username;

  Future<bool> signup({
    required String username,
    required String password,
  }) async {
    try {
      var response = await Client.dio.post("/signup", data: {
        "username": username,
        "password": password,
      });

      var token = response.data["token"];
      Client.dio.options.headers["Authorization"] = "Bearer $token";
      return true;
    } on DioError catch (e) {
      // e = exception (error)
      print(e.response!.data);
    } catch (e) {
      print("unknown error");
    }

    return false;
  }
}
