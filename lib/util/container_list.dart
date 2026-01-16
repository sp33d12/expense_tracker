import 'package:flutter/material.dart';


class ContainList extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  final String image;
  final Color? priceColor;

  const ContainList({
  super.key,
  required this.title,
  required this.subTitle,
  required this.image,
  required this.price,
  required this.priceColor,
  });

  @override
  Widget build(BuildContext context) {
    final width =  MediaQuery.sizeOf(context).width;
    final height =  MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,20,20,10),
      child: Container(
        decoration: BoxDecoration(
        color: const Color.fromARGB(255, 61, 61, 61),
        borderRadius: BorderRadius.circular(10)
        ),
        width: width,
        height: height *0.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
            children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,100,0),
              child: Text('-$price  IQD' , style: TextStyle(color: priceColor,
              fontSize: 18),),
            ),
          
             
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: 
            [
            Text(title , style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 20 
            ),),
            Text(subTitle , style: TextStyle(color: const Color.fromARGB(255, 167, 167, 167),
            fontSize: 15),),
            ],
            ), 
            Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
              width: width*0.09,
              height: height*0.05,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromARGB(0, 41, 19, 19),
              ),
              child: Image.asset(image,
              ),
            ),
              ),
            
              ],
            ),
            
            
          ],
        ),
      ),
    );
  }
}