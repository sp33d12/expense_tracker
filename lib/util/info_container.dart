import 'package:flutter/material.dart';
import 'package:expense_tracker/util/container.dart';


class InfoContainer extends StatelessWidget {
  final double bgtext;
  final double incomeTxt;
  final double expenseTxt ;

  const InfoContainer({super.key ,
  required this.bgtext ,
  required this.incomeTxt,
  required this.expenseTxt,  
  });

  @override
  Widget build(BuildContext context) {    
    final width =  MediaQuery.sizeOf(context).width;
    final height =  MediaQuery.sizeOf(context).height;
    return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: width ,
              height: height * 0.38,
              decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(25),
            ), 
            child:Column(
              children: [
            
                Container(
                  width: width,
                  height: height *0.20,
                  decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('الرصيد الإجمالي' ,style: TextStyle(
                        fontSize: 18,color: const Color(0xFFB0B0B0)
                      ),),
                      Text('$bgtext IQD',style: TextStyle(
                        fontSize: 38,
                        color: const Color(0xFFFFFFFF)
                      ),),
            
            
                    ],
                  )
                )
            
                ,Padding(
                  padding: const EdgeInsets.fromLTRB(0,15,0,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Contain(
                              text: 'الدخل', 
                              textColor:  const Color(0xFFB0B0B0),
                              secColor: const Color.fromARGB(255, 38, 115, 0),
                              bgiconColor: const Color(0xFF2F5931),
                              moneyText:incomeTxt, 
                              iconColor: const Color(0xFF01FF09),
                              icon:Icons.arrow_upward_rounded
                              ),
                            Contain(
                              textColor:  const Color(0xFFB0B0B0),
                              text: 'نفقات', 
                              moneyText:expenseTxt,
                              bgiconColor: const Color.fromARGB(255, 93, 42, 42),
                              secColor: const Color.fromARGB(255, 200, 32, 32),
                              iconColor: const Color.fromARGB(255, 255, 0, 0),
                              icon: Icons.arrow_downward_rounded,
                              ),
                              
                    ],
                  ),
                )
              ],
            )
            ),
          )
        ;
  }
}