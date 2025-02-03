
import 'package:socialmedia/features/auth/domain/entities/AppUser.dart';

abstract class AuthRepo{
  Future<AppUser?> loginWithEmailPassword(String email,String password);
  Future<AppUser?> registerWithEmailPassword(String name,String email,String password);
  Future<void> logout();
  Future<AppUser?> gerCurrentUser();
}