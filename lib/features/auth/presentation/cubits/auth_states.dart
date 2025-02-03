import 'package:socialmedia/features/auth/domain/entities/AppUser.dart';

abstract class AuthState {}

//initial
class AuthInitial extends AuthState{

}



//loading

class Authloading extends AuthState{

}


//authenticated
class Authenticated extends AuthState{
  final AppUser user;
  Authenticated(this.user);
}



//unauthenticated

class Unauthenticated extends AuthState{

}


//errors

class AuthError extends AuthState{
  final String message;
  AuthError(this.message);
}