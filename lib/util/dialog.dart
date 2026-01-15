import 'package:expense_tracker/util/catogroies.dart';
import 'package:expense_tracker/util/colorss.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogBox extends StatefulWidget {
  final TextEditingController record;
  final TextEditingController amount;
  final Function(String) onCategorySelected;

  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key , 
  required this.onCancel , 
  required this.onSave,
  required this.record,
  required this.amount,
  required this.onCategorySelected
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  final Color? appBackground =  const Color.fromARGB(255, 28 , 28, 28);
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    final width =  MediaQuery.sizeOf(context).width;
    final height =  MediaQuery.sizeOf(context).height;
    return AlertDialog(
      backgroundColor: appBg,
      elevation: 0,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1)
        ),
        width: width , 
        height: height *0.7,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(1,10,1,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
                children: [
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 40, 40, 40),   // button color
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),  // text/icon color
                  shape: RoundedRectangleBorder(
                  
                  borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 0,
                  ),onPressed: widget.onCancel, child: Icon(Icons.close_rounded),
                  ),
                  

                  Text(
                    'سجل مصروف',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 28
                    ),  
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'سجل مصروف',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18
                    ),  
                  ),
                  TextField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  controller: widget.record,
                  keyboardType: TextInputType.name,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 43, 43, 43),
                  border: OutlineInputBorder(),
                  hintText: 'مثال: قهوة , مواصلات',
                  hintTextDirection: TextDirection.rtl,
                  hintStyle:TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255)
                  )
                  
                ),
                
              ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'المبلغ',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18
                    ),  
                  ),
                  TextField(
                    style: TextStyle(
                    color: Colors.white
                  ),
                  controller: widget.amount,
                  keyboardType: TextInputType.number,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 43, 43, 43),
                  border: OutlineInputBorder(),
                  hintText: '0 IQD',
                  hintTextDirection: TextDirection.rtl,
                  hintStyle:TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255)
                  )
                ),
                
              ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'المبلغ',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18
                    ),  
                  ),
                  
                ],
              ),
            ),
            
            Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Catogroies(
                name: 'assets/car2.png',
                textcatogry: 'نقل',
                isSelected: selectedCategory == 'نقل',

                onTap: () {
                  setState(() => selectedCategory = 'نقل');
                  widget.onCategorySelected('نقل');
                },
              ),
              Catogroies(
                name: 'assets/food.png',
                textcatogry: 'طعام',
                isSelected: selectedCategory == 'طعام',
                onTap: () {
                  setState(() => selectedCategory = 'طعام');
                  widget.onCategorySelected('طعام');
                },
              ),

              Catogroies(
                name: 'assets/film.png',
                textcatogry: 'ونسة',
                isSelected: selectedCategory == 'ونسة',

                onTap: () {
                  setState(() => selectedCategory = 'ونسة');
                  widget.onCategorySelected('ونسة');
                },
              ),
                ],
              ),
              SizedBox(
                width: 50,
                height: 10,
              )
              ,Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Catogroies(
                name: 'assets/menu.png',
                textcatogry: 'أخرى',
                isSelected: selectedCategory == 'أخرى',

                onTap: () {
                  setState(() => selectedCategory = 'أخرى');
                  widget.onCategorySelected('أخرى');
                },
              ),
              Catogroies(
                name: 'assets/shop.png',
                textcatogry: 'تسوق',
                isSelected: selectedCategory == 'تسوق',

                onTap: () {
                  setState(() => selectedCategory = 'تسوق');
                  widget.onCategorySelected('تسوق');
                },
              ),
              Catogroies(
                name: 'assets/healthcare.png',
                textcatogry: 'صحة',
                isSelected: selectedCategory == 'صحة',

                onTap: () {
                  setState(() => selectedCategory = 'صحة');
                  widget.onCategorySelected('صحة');
                },
              ),

                ],
              )
            ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15,20  ,15,20),
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,   // button color
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),  // text/icon color
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 18),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              ),onPressed: widget.onSave, child: Text('سجل الآن' , style: TextStyle(fontSize: 20),
              ),
              ),
              ),
          ]
        )
      )
    );
  }
}