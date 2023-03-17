import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

 static LoginCubit get(context) => BlocProvider.of(context);

  //Part Of Designe
  bool isPassword = false;

  IconData suffix = IconlyLight.show;


  void changeVisibilitePassword(){
    isPassword = !isPassword;
    suffix = isPassword ? IconlyLight.show :IconlyLight.hide;
    emit(changeVisibilitePasswordState());
  }

 void userLogin({
  required String email,
  required String password,
}){

    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {

      print(value.user!.email);
      print(value.user!.uid);
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
 }
 
}
