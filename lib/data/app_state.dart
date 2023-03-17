part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

//Change Theme Mode of application

class changeThemeModeAppState extends AppState{}

//Log Out Part
class logOutAppState extends AppState{}

//Bottom Navigation Bar
class changeBottomNavigationBarState extends AppState{}
//get Users info

class getUserDataSuccessState extends AppState{}
class getUserDataErrorState extends AppState{
  final String error;
  getUserDataErrorState(this.error);
}


//Post Images

/****get Post Image**/
class getPostImageSuccessState extends AppState{}
class getPostImageErrorState extends AppState{}

/***remove Post Image***/
class removeImgPostSuccessState extends AppState{}


/***Upload Post ***/
class CreatePostLoadingState extends AppState{}
class CreatePostSuccessState extends AppState{}
class CreatePostErrorState extends AppState{
  final String error;
  CreatePostErrorState(this.error);
}

/****Create Post****/
class UplodPostImgLoadingState extends AppState{}
class UplodPostImgSuccessState extends AppState{}
class UplodPostImgErrorState extends AppState{
  final String error;
  UplodPostImgErrorState(this.error);
}

//Partie of Get all Posts

class getPostsLoadingState extends AppState{}
class getPostsSuccessState extends AppState{}
class getPostsErrorState extends AppState{
  final String error;
  getPostsErrorState(this.error);
}

//get all users
class getAllUsersLoadingState extends AppState{}
class getAllUsersSuccessState extends AppState{}
class getAllUsersErrorState extends AppState{
  final String error;
  getAllUsersErrorState(this.error);
}