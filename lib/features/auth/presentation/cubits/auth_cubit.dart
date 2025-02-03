import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/features/auth/domain/entities/AppUser.dart';
import 'package:socialmedia/features/auth/domain/repos/auth_repos.dart';
import 'package:socialmedia/features/auth/presentation/cubits/auth_states.dart';

class Authcubit extends Cubit<AuthState>{
  final AuthRepo authRepo;
  AppUser? _currentUser;
  Authcubit({required this.authRepo}) : super(AuthInitial());

  //ON regarde si l'utilisateur est connecter
  void checkAuth()async{
    final AppUser? user = await authRepo.gerCurrentUser();

    if(user != null){
      _currentUser = user;
      emit(Authenticated(user));
    }
    else{
      emit(Unauthenticated());
    }
  }

  //On recupere l'utilisateur connecté

  AppUser? get currentUser => _currentUser;


  //Connexion avec email et mot de passe

Future<void> login(String email, String psw)async{
  try{
    emit(Authloading());
    final user = await authRepo.loginWithEmailPassword(email, psw);

    if(user != null){
      _currentUser = user;
      emit(Authenticated(user));
    }else{
      emit(Unauthenticated());

    }

  }catch(e){

    emit(AuthError(e.toString()));
    emit(Unauthenticated());
  }
}
  //Inscription

  Future<void> register(String name,String email, String psw)async{
    try{
      emit(Authloading());
      final user = await authRepo.registerWithEmailPassword(name ,email, psw);

      if(user != null){
        _currentUser = user;
        emit(Authenticated(user));
      }else{
        emit(Unauthenticated());
      }

    }catch(e){
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }


//logout
Future<void> logout() async{
  authRepo.logout();
  emit(Unauthenticated());
}

}