
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/models/login_model.dart';
import 'package:task_app/modules/login/cubit/states.dart';
import 'package:task_app/shared/network/end_points.dart';
import 'package:task_app/shared/network/remote/dio_helper.dart';

class TaskLoginCubit extends Cubit<TaskLoginStates>{

  TaskLoginCubit():super(TaskLoginInitialState());
  static TaskLoginCubit get(context) =>BlocProvider.of(context);

  LoginModel? loginModel;
  void userLogin({
  required String phone,
    required String password,
}){
    emit(TaskLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'phone':phone,
      'password':password,
    }).then((value){
      loginModel =LoginModel.fromJson(value.data);
      emit(TaskLoginSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(TaskLoginErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  void changePassword(){
    isPassword = !isPassword;
    emit(ChangePasswordVisibilityState());
  }


}