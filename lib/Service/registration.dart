import 'dart:developer';

import 'package:oddo_combat/Model/Authentication/Registrationmodel.dart';
import 'package:oddo_combat/Repository/Authentication/registerrepo.dart';

class Authenticationservice{
Registerrepo register = Registerrepo();
    Future<void> registerUser(String Name,  String email,
      String password, String role,String phoneNumber) async {
        log(phoneNumber);
    await register.registerUser(RegistrationModel(name: Name, email: email, password: password, role: role, phoneNumber: phoneNumber));
    
      }
}