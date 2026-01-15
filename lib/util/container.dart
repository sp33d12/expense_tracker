import 'package:flutter/material.dart';


class Contain extends StatelessWidget {
  final String text;
  final double moneyText;
  final IconData icon;
  final Color iconColor;
  final Color bgiconColor;
  final Color textColor;
  final Color secColor;

  const Contain({super.key , 
  required this.text ,
  required this.moneyText,
  required this.icon,
  required this.iconColor,
  required this.textColor,
  required this.secColor,
  required this.bgiconColor,
  });
  
  @override
  Widget build(BuildContext context) {    
    final width =  MediaQuery.sizeOf(context).width;
    final height =  MediaQuery.sizeOf(context).height;
    return Container(
    
    width: width * 0.44,height: height*0.15,
    decoration: BoxDecoration(
    color: const Color.fromARGB(255, 37, 37, 37),

    borderRadius: BorderRadius.circular(25),
    
    
    
    ),  
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(text, style: TextStyle(
            color: textColor,
            fontSize: 25,
          ),),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
              
              Container(
                width: width*0.11,
                height: height*0.05,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: bgiconColor,
                ),
                child: Icon(icon,
                weight: 15,
                
                size: 25,
                color: iconColor,
                ),
              ),
              Text('$moneyText IQD' , style: TextStyle(
              color:secColor,
              fontSize: 18
              ),)
            ],),
          )
          
        ],
      ),
    ),
    );
  }
}