import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
 final DataEntity? data;

 const LoginEntity({this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class DataEntity extends Equatable{
   String? token;
   String? username;

   DataEntity({this.token, this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [token,username];
}
