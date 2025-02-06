import '../domain/entities/profile_user.dart';
import '../domain/repository/profile_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirebaseProfileRepo implements ProfileRepo{

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<ProfilUser?> fetchUserProfile(String uid) async{
    try{

      final userDoc = await firebaseFirestore.collection('users').doc(uid).get();
      if(userDoc.exists){
        final userData = userDoc.data()!;
        return ProfilUser(uid: uid, email: userData['email'], name: userData['name'], bio: userData['bio'], profileImageUrl: userData['profileImageUrl'].toString());
      }

      return null;

    }catch (e){
        return null;
    }
  }

  @override
  Future<void> updateProfile(ProfilUser updateProfile) async{

    try{
      await firebaseFirestore.collection('users').doc(updateProfile.uid)
          .update({
        'bio': updateProfile.bio,
        'profileImageUrl' : updateProfile.profileImageUrl
      });
    }catch(e){
      throw Exception(e);
    }
  }
  
}