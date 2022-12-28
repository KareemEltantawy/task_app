import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/models/my_codes_model.dart';
import 'package:task_app/modules/my_code/cubit/states.dart';
import 'package:task_app/shared/components/constants.dart';
import 'package:task_app/shared/network/end_points.dart';
import 'package:task_app/shared/network/remote/dio_helper.dart';

class TaskCubit extends Cubit<TaskStates>{
  TaskCubit():super(TaskInitialState());
  static TaskCubit get(context)=> BlocProvider.of(context);

  MyCodesModel? myCodesModel;
  void getCodes(){
    DioHelper.getData(url: CODES,token: 'Bearer $token').then((value){
      myCodesModel = MyCodesModel.fromJson(value.data);
      emit(TaskGetCodesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(TaskGetCodesErrorState());
    });
  }

}