import 'package:socialmedia/features/auth/domain/entities/AppUser.dart';

class ProfilUser extends AppUser{
  final String bio;
  final String profileImageUrl;


  ProfilUser({
    required super.uid,
    required super.email,
    required super.name,
    required this.bio,
    required this.profileImageUrl,
});

  //Mise A jout du profil utilisateur
  ProfilUser copywith({String? newBio, String? newProfileImageurl}){
    return ProfilUser(uid: uid, email: email, name: name, bio: bio, profileImageUrl: profileImageUrl);
  }


  //Convertir le profil utilisateur en Json

  Map<String,dynamic> toJson(){
      return {
        'uid' : uid,
        'email':email,
        'name' : name,
        'bio' : bio,
        'profileImageUrl': profileImageUrl

      };
  }


  //Convertir un json en objet User
  factory ProfilUser.fromJson(Map<String, dynamic> json){
    return ProfilUser(uid: json['uid'], email: json['email'], name: json['name'], bio: json['bio'] ?? '', profileImageUrl: json['profileImageUrl'] ?? '');
  }
}