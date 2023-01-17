import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
 class Utilities{
   static void push(BuildContext context,Widget screen){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen));
  }

  static showToast(String msg){
    Fluttertoast.showToast(
        msg:msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }
}
//update task