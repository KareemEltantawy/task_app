import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/login/login_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/styles/themes.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await CacheHelper.init();  //lAn ba await ala CacheHelper.init() lazem el main ybka async we lAn el main bka async lazwm adef el method...> WidgetsFlutterBinding.ensureInitialized()
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

//  bool? isDark = CacheHelper.getData(key: 'isDark'); // we use the same key we use in saveData method

  runApp(MyApp(
//    isDark: isDark,
  ));
}


class MyApp extends StatelessWidget
{
//  bool? isDark;
//  MyApp({this.isDark});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
//      darkTheme: darkTheme,
//      themeMode: AppCubit.get(context).isDark ? ThemeMode.dark: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // put the class of the first screen
    );
  }
}
