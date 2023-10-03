import 'package:cubit_rest_api/cubit/user_cubit_state.dart';
import 'package:cubit_rest_api/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user_model.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<Users> userList = [];
  ApiService apiService;
  UserCubit({required this.apiService}) : super(UserCubitInit());

  void getAllUserList() async {
    try {
      emit(UserCubitLoading());
      userList = await apiService.getData();
      emit(UserCubitDataLoaded(userList: userList));
    } catch (e) {
      emit(UserCubitError(message: e.toString()));
    }
  }
}
