import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:vente_app/model/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

 static RegisterCubit get(context) => BlocProvider.of(context);

 //Part Of Designe
bool isPassword = false;

IconData suffix = IconlyLight.show;
//IconData suffix = IconlyBold.search;

void changeVisibilitePassword(){
  isPassword = !isPassword;
  suffix = isPassword ? IconlyLight.show :IconlyLight.hide;
  emit(changeVisibilitePasswordState());
}

 //Part of Firebase
 /***************** Register User *******************/

 UserModel? usermodel;

void userRegister({
  required String email,
  required String password,
  required String phone,
  required String name,
}){
  emit(RegisterLoadingState());
  FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password
  ).then((value)
  {
  creatUserData(
      email: email,
      uid: value.user!.uid,
      phone: phone,
      name: name,
      ProfilImg: " aseets/images/bg.png"
  );
    emit(RegisterSuccessState());
  }).catchError((onError){
    print(onError.toString());
    emit(RegisterErrorState(onError.toString()));
  });
}



void creatUserData({
  required String email,
  required String uid,
  required String phone,
  required String name,
  required String ProfilImg,
}){
  UserModel usercreate = UserModel(
    email:email ,
    name:name ,
    Phone:phone ,
    ProfilImg: ProfilImg,
    Uid: uid,
  );

 FirebaseFirestore.instance.collection("users")
     .doc(uid)
     .set(usercreate.ToMap())
     .then((value) {
       emit(CreateUserSuccessState());
     }).catchError((error){
   emit(CreateUserErrorState(error.toString()));
 });

}


}
