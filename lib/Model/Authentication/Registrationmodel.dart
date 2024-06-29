// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class RegistrationModel {
  String name;
  String email;
  String password;
  String phoneNumber;
  String role;
  RegistrationModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
  });
 

  RegistrationModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? role,
  }) {
    return RegistrationModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'role': role,
    };
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      role: map['role'] as String,
    );
  }

   Map<String, dynamic>  toJson() {
      return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'role': role,
    };
  }

  factory RegistrationModel.fromJson(String source) => RegistrationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegistrationModel(name: $name, email: $email, password: $password, phoneNumber: $phoneNumber, role: $role)';
  }

  @override
  bool operator ==(covariant RegistrationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.phoneNumber == phoneNumber &&
      other.role == role;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phoneNumber.hashCode ^
      role.hashCode;
  }
}
