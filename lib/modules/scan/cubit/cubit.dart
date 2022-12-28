import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:task_app/models/scan_model.dart';
import 'package:task_app/modules/scan/cubit/states.dart';
import 'package:task_app/shared/components/constants.dart';
import 'package:task_app/shared/network/end_points.dart';
import 'package:task_app/shared/network/remote/dio_helper.dart';


class TaskkCubit extends Cubit<TaskkStates>{
  TaskkCubit():super(TaskkInitialState());
  static TaskkCubit get(context)=> BlocProvider.of(context);

ScanModel? scanModel;
void sendScan(String code){
  DioHelper.postData(url: SCAN, data: {
    'code':code,
  },token:  'Bearer $token').then((value) {
    scanModel = ScanModel.fromJson(value.data);
    emit(TaskkScanSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(TaskkScanErrorState());
  });
}


  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      result = event;
      emit(TaskkResultState());
    });}


}