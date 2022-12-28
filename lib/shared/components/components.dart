import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_app/shared/styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  double radius = 3.0,
  required var function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius,),
        color: background,
      ),
    );




Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  required var validate,
  required String hint,
  IconData? suffix,
  var suffixPressed,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  validator: validate,
  decoration: InputDecoration(
    hintText: hint,
    suffixIcon: suffix != null
        ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffix,
      ),
    )
        : null,
    border: OutlineInputBorder(),
  ),
);

void navigateTo(context, widget) => Navigator.push(context, MaterialPageRoute(
  builder: (context) => widget,
),
);

void navigateAndFinish(
    context,
    widget,) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget,), (route) => false);

void showToast({
  required String msg,
  required Color backgroundColor,
}) => Fluttertoast.showToast(
  msg: msg,
  backgroundColor: backgroundColor,
  textColor: Colors.white,
  toastLength: Toast.LENGTH_LONG, // LENGTH_LONG 5s for android
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,  //5s for Ios,Web
  fontSize: 16.0,
);
