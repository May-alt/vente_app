import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vente_app/layouts/navigat_route/nav_route.dart';
import 'package:vente_app/model/post_model.dart';
import 'package:vente_app/model/user_model.dart';
import 'package:vente_app/modules/authentifications/login/login_screens.dart';
import 'package:vente_app/modules/pages/home/home_Screens.dart';
import 'package:vente_app/modules/pages/post/post_screens.dart';
import 'package:vente_app/modules/pages/setting/setting_screens.dart';
import 'package:vente_app/shared/cache_helper/cacheHelpere.dart';
import 'package:vente_app/shared/save_const.dart';
import 'package:image_picker/image_picker.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  //Navigation Bottom Bar

int currentIndex = 0;

  List<String> titles=[
    "home",
    "Post",
    "Setting",
  ];

  List<Widget> Screnns = [
    HomeScreens(),
    PostScreens(),
  //  FavoritScreens(),
    SettingsScreens(),
  ];

  void changeBottomNavigationBar(int index){

    currentIndex = index;
    emit(changeBottomNavigationBarState());
}

///Part Of Change Mode

  var isDark = false;

  void changeModeApp({bool? FromShredMode})
  async{
     if(FromShredMode != null){
       isDark == FromShredMode;
     }
     else{
       isDark =! isDark;
       Cachehelper.saveData(key: 'isDark', value: isDark)
           .then((value){
             emit(changeThemeModeAppState());
       });
     }
  }
//getUser
UserModel? usermodel;

void getUserModel(){
    FirebaseFirestore.instance.collection("users")
        .doc(Uid)
        .get()
        .then((value){
          print(value.data());
          usermodel= UserModel.fromJson(value.data());
          emit(getUserDataSuccessState());
    })
        .catchError((error){
      emit(getUserDataErrorState(error.toString()));
    });
}



  /***Get Post Image***/

  final ImagePicker _picke = ImagePicker();
  File? PostimagePiked;

  void getPostImg() async{
    final pickedFile = await _picke.getImage(source: ImageSource.gallery);
    if(pickedFile != null){
      PostimagePiked =File(pickedFile.path);
      emit(getPostImageSuccessState());
    }
    else{
      print('NoImage selected');
      emit(getPostImageErrorState());
    }
  }

  void removePostImg(){
    PostimagePiked = null;
    emit(removeImgPostSuccessState());
  }

  //Create a new Post

  PostModel? postmodel;

  void CreatNewPost({

    required String? title,
    required String? Price,
    required String? Des,
    String? Postimage,

  })async{
    emit(CreatePostLoadingState());

    PostModel postmodel = PostModel(
      name:usermodel!.name,
      uId:usermodel!.Uid,
      imgProfile : usermodel!.ProfilImg,
      //Si image est null ajouter vide
      Postimage: Postimage??'',
      title:title,
      Price:Price,
      desc: Des,
    );

    FirebaseFirestore
        .instance
        .collection('posts')
        .add(postmodel.ToMap())
        .then((value){
          print(value);
      emit(CreatePostSuccessState());
    }).catchError((error){
      emit(CreatePostErrorState(error.toString()));
    });
  }

  //mettre le path image on fireStorage
void UplodPostImg({
  required String title,
  required String Price,
  required String? Des,
})async{
  emit(UplodPostImgLoadingState());

  FirebaseStorage.instance
      .ref()
      .child('posts/${Uri.file(PostimagePiked!.path).pathSegments.last}')
      .putFile(PostimagePiked!)
      .then((value){
        //prend le path que j'ajouter dans fireStorage
        value.ref.getDownloadURL().then((value) {
              print(value);
            //Matintent Creee le Post
              CreatNewPost(Price: Price,title:title,Postimage: value,Des: Des );

              emit(UplodPostImgSuccessState());
          }).catchError((error){
           emit(UplodPostImgErrorState(error.toString()));
        });
      }).catchError((error){
    emit(UplodPostImgErrorState(error.toString()));
  });



}

//Partie of Posts
/*************get All Posts******************/
List<PostModel> posts = [];

  void getAllPosts()
  async{
    emit(getPostsLoadingState());
    FirebaseFirestore
        .instance
        .collection('posts')
        .get()
        .then((value) {
       //na3mel foreach Ela koul doc bach n3abiha fi liste mta3i
          value.docs.forEach((element) {
           //ajouter chaque doc dans le liste of posts
          posts.add(PostModel.fromJson(element.data()));
          });

          emit(getPostsSuccessState());
    }).catchError((error){
      emit(getPostsErrorState(error.toString()));
    });

  }

/*************get AllUsers******************/

List<UserModel> users = [];

  void getAllUsers(){
    emit(getAllUsersLoadingState());
    FirebaseFirestore
        .instance
        .collection('users')
        .get()
        .then((value) {
          value.docs.forEach((element) {
            users.add(UserModel.fromJson(element.data()));
          });
          emit(getAllUsersSuccessState());
    })
        .catchError((error){
          emit(getAllUsersErrorState(error.toString()));
    });
  }

  //Log Out Parti
  // void logOut({context}) async {
  //   FirebaseAuth.instance
  //       .signOut()
  //       .then((value) {
  //     emit(logOutAppState());
  //   });
  // }

}
