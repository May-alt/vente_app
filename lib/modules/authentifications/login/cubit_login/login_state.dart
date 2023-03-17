part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class changeVisibilitePasswordState extends LoginState{}

class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{
  final String Uid;
  LoginSuccessState(this.Uid);
}
class LoginErrorState extends LoginState{
  final String error;
  LoginErrorState(this.error);
}



