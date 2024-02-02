import 'package:appointment/feature/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity{
 String? message;
   bool? status;
   int? code;
    LoginModel({this.message, super.data, this.status, this.code});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
  }
}

class DataLoginModel extends DataEntity{

   DataLoginModel({super.token, super.username});

  DataLoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
  }

}
