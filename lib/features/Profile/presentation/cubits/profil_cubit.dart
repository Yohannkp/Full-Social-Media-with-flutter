import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/features/Profile/domain/repository/profile_repository.dart';
import 'package:socialmedia/features/Profile/presentation/cubits/profil_state.dart';

class ProfileCubit extends Cubit<ProfileState>{
  final ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());


  //fetch user profil using repo
Future<void> fetchuserprofile(String uid) async{

  try{
    emit(Profileloading());

    final user = await profileRepo.fetchUserProfile(uid);

    if(user != null){
      emit(Profileloaded(user));
    }else{
      emit(ProfileError("Aucun utilisateur trouver"));
    }
  }
  catch(e){
    emit(ProfileError(e.toString()));
  }



}

//UPDATE bio and profile picture
  Future<void> updateProfile({
    required String uid,
    String? newBio,
  }) async{
  emit(Profileloading());

  try {

    final currentUser = await profileRepo.fetchUserProfile(uid);

    if(currentUser == null){
      emit(ProfileError("Erreur lors de la mise a jour du profil"));
    }

    final updateprofile =
        currentUser!.copywith(newBio: newBio ?? currentUser.bio);

    await profileRepo.updateProfile(updateprofile);

    await fetchuserprofile(uid);

  }catch(e){
    emit(ProfileError("Error updating profile: $e"));
  }
  }




}