
import 'package:flutter/material.dart';

class ConstantsWidgets{
  static const appName='Expense Manager';
 static  getSnakeBar(BuildContext context, String message,
      {GlobalKey<ScaffoldMessengerState>? scaffold}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          elevation: 0,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text(message , textAlign: TextAlign.center,),
          margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),

          backgroundColor: Colors.lightBlue),
    );
  }

  static showError (context,message,GlobalKey<ScaffoldMessengerState>? scaffold) {
    return scaffold?.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        )
    );
  }
}