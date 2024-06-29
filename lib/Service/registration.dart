import 'dart:developer';

import 'package:oddo_combat/Model/Authentication/Registrationmodel.dart';
import 'package:oddo_combat/Repository/Authentication/loginrepo.dart';
import 'package:oddo_combat/Repository/Authentication/registerrepo.dart';

class Authenticationservice{
Registerrepo register = Registerrepo();
Loginrepo login = Loginrepo();
    Future<void> registerUser(String Name,  String email,
      String password, String role,String phoneNumber) async {
        log(phoneNumber);
    await register.registerUser(RegistrationModel(name: Name, email: email, password: password, role: role, phoneNumber: phoneNumber));
    
      }
       Future<void> loginUser(  String email,
      String password, String role) async {
        log(password);
    await login.loginUserWithNameEmailAndPassword(email, password, role);
      }
}