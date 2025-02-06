import '../entities/profile_user.dart';

abstract class ProfileRepo{
  Future<ProfilUser?> fetchUserProfile(String uid);
  Future<void> updateProfile(ProfilUser updateProfile);
}