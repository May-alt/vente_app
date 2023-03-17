part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class changeVisibilitePasswordState extends RegisterState{}

//register User
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{}
class RegisterErrorState extends RegisterState{
  final String error;
  RegisterErrorState(this.error);
}

//Create User


class CreateUserSuccessState extends RegisterState{}
class CreateUserErrorState extends RegisterState{
  final String error;
  CreateUserErrorState(this.error);
}



