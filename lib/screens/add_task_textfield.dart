import 'package:flutter/material.dart';

class AddTaskTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final bool? isDate;
  final  VoidCallback?  onTap;
  final bool? readOnly;
  final String? Function(String? text) validator;
   const AddTaskTextField({Key? key,this.controller,this.title,this.isDate,this.onTap,this.readOnly=false,required this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return TextFormField(
     readOnly: readOnly!,
     onTap: onTap,
      validator:validator ,
      controller: controller,
      decoration:  InputDecoration(
        suffixIcon: isDate!? const Icon(Icons.date_range,color: Colors.blue,):null,
        label:  Text(title!),
        filled: readOnly,
        fillColor: const Color(0xffF8F8F8),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue,width: 2),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,width: 2),
        ),

      ),
    );
  }
}
