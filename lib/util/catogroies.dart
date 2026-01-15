import 'package:flutter/material.dart';


class Catogroies extends StatelessWidget {
  final String name;
  final String textcatogry;
  final VoidCallback onTap;
  final bool isSelected;

  const Catogroies({super.key,
  required this.name,
  required this.textcatogry,
  required this.onTap,
  required this.isSelected
  });

  @override
  Widget build(ontext) {
    return GestureDetector(

      onTap: onTap,
      child: Container(
      width: 85,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected
          ?Colors.blueAccent 
          : const Color.fromARGB(255, 35, 35, 35)
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(name),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Text(textcatogry ,style: TextStyle(
                color: Colors.white
              ),),
            )
          ],
        ),
      ),
        ),
    );
  }
}