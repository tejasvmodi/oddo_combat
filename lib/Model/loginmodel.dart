// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  String Email;
  String Password;
  String Role;
  LoginModel({
    required this.Email,
    required this.Password,
    required this.Role,
  });

  LoginModel copyWith({
    String? Email,
    String? Password,
    String? Role,
  }) {
    return LoginModel(
      Email: Email ?? this.Email,
      Password: Password ?? this.Password,
      Role: Role ?? this.Role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Email': Email,
      'Password': Password,
      'Role': Role,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      Email: map['Email'] as String,
      Password: map['Password'] as String,
      Role: map['Role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(Email: $Email, Password: $Password, Role: $Role)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.Email == Email &&
      other.Password == Password &&
      other.Role == Role;
  }

  @override
  int get hashCode => Email.hashCode ^ Password.hashCode ^ Role.hashCode;
}
