import 'package:socialmedia/features/Profile/domain/entities/profile_user.dart';

abstract class ProfileState {}

//initial
class ProfileInitial extends ProfileState {}


//loadin
class Profileloading extends ProfileState {}


//loaded
class Profileloaded extends ProfileState {
  final ProfilUser profilUser;
  Profileloaded(this.profilUser);
}



//Error
class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}


