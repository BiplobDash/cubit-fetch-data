import 'package:equatable/equatable.dart';

import '../model/user_model.dart';

abstract class UserCubitState extends Equatable {
  const UserCubitState();
}

class UserCubitInit extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class UserCubitLoading extends UserCubitState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class UserCubitDataLoaded extends UserCubitState {
  List<Users> userList;
  UserCubitDataLoaded({required this.userList});
  @override
  List<Object?> get props => [userList];
}

// ignore: must_be_immutable
class UserCubitError extends UserCubitState {
  String message;
  UserCubitError({required this.message});
  @override
  List<Object?> get props => [message];
}
