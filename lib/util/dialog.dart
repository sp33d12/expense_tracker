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
  
    return AlertDialog(
  backgroundColor: appBg,
  elevation: 0,
  content: SizedBox(

    width: MediaQuery.of(context).size.width,
    child: SingleChildScrollView(   
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF282828),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    elevation: 0,
                  ),
                  onPressed: widget.onCancel,
                  child: const Icon(Icons.close_rounded , color: Colors.white,),
                ),
                const Text(
                  'سجل مصروف',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
          ),

          // الوصف
          TextField(
            controller: widget.record,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintTextDirection: TextDirection.rtl,
              filled: true,
              fillColor: Color(0xFF2B2B2B),
              hintText: 'مثال: قهوة , مواصلات',
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),

          // المبلغ
          TextField(
            controller: widget.amount,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintTextDirection: TextDirection.rtl,
              filled: true,
              fillColor: Color(0xFF2B2B2B),
              hintText: '0 IQD',
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),

          // الفئات
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,           
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 2,
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
          ),
          const SizedBox(height: 20),

          // زر الحفظ
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: widget.onSave,
                child: const Text(
                  
                  'سجل الآن',
                  style: TextStyle(fontSize: 20,
                  color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

  }
}