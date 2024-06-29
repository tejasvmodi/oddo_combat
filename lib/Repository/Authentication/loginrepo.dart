import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oddo_combat/Exception/auth_exception.dart';
import 'package:oddo_combat/Model/loginmodel.dart';
import 'package:oddo_combat/Model/token_manager.dart';
import 'package:oddo_combat/UI/Authentication/login.dart';
import 'package:oddo_combat/UI/Resident%20Ui/resident_home.dart';
import 'package:oddo_combat/Util/constant.dart';
import 'package:oddo_combat/Util/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Loginrepo{
  Future<void> loginUserWithNameEmailAndPassword(
      String email, String password,String role) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.post(
        Uri.parse("$apiUrl/auth/login"),
        body: LoginModel(Email: email,Password: password,Role: role).toJson(),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await prefs.setBool("isLoggedIn", true);
        await TokenManager.saveToken(data['token']);

        Get.offAll(() => ResidentHome());

        // log(data['token']);
      } else if (response.statusCode == 500) {
        Get.offAll(() => const Login());
        showSnackkBar(
          message: 'Username Or Password Invalid',
          title: 'Try Again',
          icon: const Icon(Icons.error),
        );
        throw SignUpWithEmailAndPasswordFailure.code("404");
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure();
      showSnackkBar(
        message: ex,
        title: 'Try Again',
        icon: const Icon(Icons.error),
      );
    }
  }
}