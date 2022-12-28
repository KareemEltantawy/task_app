import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/modules/my_code/my_code_screen.dart';
import 'package:task_app/modules/scan/scan_screen.dart';
import 'package:task_app/shared/components/components.dart';
import 'package:task_app/shared/components/constants.dart';
import 'package:task_app/shared/network/local/cache_helper.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TaskLoginCubit(),
      child: BlocConsumer<TaskLoginCubit, TaskLoginStates>(
        listener: (context, state) {
          if (state is TaskLoginSuccessState) {
            if (state.loginModel.status! == 1) {
              CacheHelper.saveData(
                      key: 'token',
                  value: state.loginModel.data!.token
              ).then((value) {
                token = state.loginModel.data!.token;
                navigateTo(context, ScanScreen());
              });
            } else {
              showToast(
                  msg: state.loginModel.massage!,
                  backgroundColor: Colors.red);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: 120.0,
                      ),

                      defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'email must not be empty';
                            }
                            return null;
                          },
                        hint: 'Enter your phone',
                          ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                          controller: passwordController,
                          isPassword: TaskLoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            TaskLoginCubit.get(context).changePassword();
                          },
                          suffix: TaskLoginCubit.get(context).isPassword ? Icons.visibility : Icons.visibility_off,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'password must not be empty';
                            }
                            return null;
                          },
                          hint: 'Password',),
                      SizedBox(
                        height: 35.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('forget password?',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey
                          ),)
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: defaultButton(function: (){
                          if(formKey.currentState!.validate()){
                            TaskLoginCubit.get(context).userLogin(
                                phone: phoneController.text,
                                password: passwordController.text
                            );
                          }
                        },
                            text:'Login'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
