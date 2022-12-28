
import 'package:task_app/models/login_model.dart';

abstract class TaskLoginStates{}

class TaskLoginInitialState extends TaskLoginStates{}

class TaskLoginLoadingState extends TaskLoginStates{}

class TaskLoginSuccessState extends TaskLoginStates{
  final LoginModel loginModel;

  TaskLoginSuccessState(this.loginModel);
}

class TaskLoginErrorState extends TaskLoginStates{
  final String error;

  TaskLoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends TaskLoginStates{}