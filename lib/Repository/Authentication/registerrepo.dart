import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oddo_combat/Model/Authentication/Registrationmodel.dart';
import 'package:oddo_combat/Model/token_manager.dart';
import 'package:oddo_combat/UI/Authentication/login.dart';
import 'package:oddo_combat/UI/Authentication/register.dart';
import 'package:oddo_combat/Util/constant.dart';
import 'package:oddo_combat/Util/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Registerrepo {
  Future<void> registerUser(RegistrationModel user) async {
     log(user.name);
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/auth/signup'),
        body: jsonEncode(user), // Encode user data directly
        headers: {
          'Content-Type': 'application/json'
        }, // Remove content-type from headers
      );
      log(response.body.toString());
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await TokenManager.saveToken(data['token']);
        Get.offAll(() => const Login());
      } else {
        Get.offAll(() => const Registration());
        showSnackkBar(
          message: 'Added some invalid Credentials',
          title: 'Try Again',
          icon: const Icon(Icons.error),
        );
        throw Exception('Failed to register user');
      }
    } catch (e) {
      const ex = 'Added some invalid Credentials';
      showSnackkBar(
        message: ex,
        title: 'Try Again',
        icon: const Icon(Icons.error),
      );
      log('Exception during registration: $e');
      throw Exception('Failed to register user');
    }
  }
}
