import 'package:expense_tracker/util/colorss.dart';
import 'package:flutter/material.dart';


class Clear extends StatelessWidget {
  final VoidCallback onClear;

  const Clear({super.key ,required this.onClear});

  @override
  Widget build(BuildContext context) {
    final width =  MediaQuery.sizeOf(context).width;
    final height =  MediaQuery.sizeOf(context).height;
    return AlertDialog(
      backgroundColor: appBg,
      elevation: 0,
      content: Container(
        width: width,
        height: height*0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.transparent
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             ElevatedButton(
             style: ElevatedButton.styleFrom(
             backgroundColor: Colors.white,   // button color
             foregroundColor: Colors.black,  // text/icon color
             padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
             shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10),
             ),
             elevation: 0,
             ),
             onPressed: onClear, 
             child: Text('متاكد؟؟' , style: TextStyle(
               fontSize: 20
             ),)),
        
            Text('تصفر حساب' ,style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),),
            
          ],),
        ),
      ),

    );
  }
}
