import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TaskListItem extends StatelessWidget {
  String? title;
  bool? isChecked;
  String? subTitle;
  VoidCallback? update;
  VoidCallback? onTap;
   TaskListItem({Key? key,this.title,this.subTitle,this.isChecked,this.onTap,this.update}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isChecked!?Row(
      children: [
      GestureDetector(
        onTap: update,
        child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1.5,color: const Color(0xffDADADA))
        ),
    ),
      ),
        const SizedBox(width: 20,),
        GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(title!,style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500,color: const Color(0xff575767)),),
              ),
              const SizedBox(height: 5,),
              Text(subTitle!,style:GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14,color: Color(0xffB9B9BE)))
            ],
          ),
        ),
      ],
    ): Row(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1.5,color: const Color(0xffDADADA))
          ),
          child: Image.asset('assets/images/check.png'),
        ),
        const SizedBox(width: 20,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!,style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500,color: const Color(0xff575767)),),
          ],
        ),

      ],
    );
  }
}
