import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialmedia/features/auth/domain/entities/AppUser.dart';
import 'package:socialmedia/features/auth/domain/repos/auth_repos.dart';
import 'package:socialmedia/features/auth/presentation/cubits/auth_cubit.dart';


import '../presentation/cubits/auth_states.dart';

class FirebaseAuthRepo implements AuthRepo{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  AppUser? _userFromFireBaseUser(User? user){
    return user != null ? AppUser(uid: user.uid, email: user.email!, name: '') : null;
  }

  @override
  Future<AppUser?> gerCurrentUser() async{
    // TODO: implement gerCurrentUser
    final firebaseUser = _auth.currentUser;

    //Non connecté
    if(firebaseUser == null){
      return null;
    }else{
      return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!, name: '');
    }
      }

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async{
    // TODO: implement loginWithEmailPassword



      UserCredential result =await _auth.signInWithEmailAndPassword(email: email, password: password);User? user = result.user;
      return _userFromFireBaseUser(user);



  }

  @override
  Future<void> logout() async{
    // TODO: implement logout
    try{
      return await _auth.signOut();
    }catch(exeption){
    print(exeption.toString());
    return null;
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(String name,String email, String password) async{
    try{

      UserCredential result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      AppUser usersignin = AppUser(uid: user!.uid, email: user.email!, name: name, );

      
      //Ajout de l'utilisateur dans le firestore
      await firebaseFirestore.collection("users").doc(usersignin.uid).set(usersignin.toJson());
      return _userFromFireBaseUser(user);
    }
    catch(exeption){
      print("Erreur lors de l'inscription : ${exeption.toString()}");

    }
  }
  
}