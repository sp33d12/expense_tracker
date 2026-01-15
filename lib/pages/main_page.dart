
// ignore_for_file: must_be_immutable

import 'package:expense_tracker/util/chart.dart';
import 'package:expense_tracker/util/clear.dart';
import 'package:expense_tracker/util/colorss.dart';
import 'package:expense_tracker/util/container_list.dart';
import 'package:expense_tracker/util/dialog.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/util/info_container.dart';

class MainPage extends StatefulWidget {
  final double totalBalance;
  const MainPage({super.key , required this.totalBalance});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();
  final record = TextEditingController();
  final amount = TextEditingController();
  double incomeTxt = 0;
  double expenseTxt = 0;
  int count = 0;
  late double balance;
  bool showChart = false;
  int durationTime = 0;

  @override
  void initState(){
    super.initState();
    balance = widget.totalBalance;
    incomeTxt =balance;
  }
  String selectedCategory = '';


  List<Map<String, dynamic>> contain = [];
  Map<String, double> categoryTotals = {};


  final Map<String, String> categoryIcons = {
  'نقل': 'assets/car2.png',
  'طعام': 'assets/food.png',
  'ونسة': 'assets/film.png',
  'تسوق': 'assets/shop.png',
  'صحة': 'assets/healthcare.png',
  'أخرى': 'assets/menu.png',
};

  void clear(){
    showDialog(context: context, builder: (builder){
      return Clear(
        onClear: (){
          setState(() {
            balance = 0;
            incomeTxt = 0;
            expenseTxt = 0;
            showChart = false;
            contain.clear();
          });
        },
      ); 
    });
  }

 
  void addItem(){
    showDialog(
      context: context,
      builder: (builder){
        return DialogBox(
          onCategorySelected: (cat) {
          selectedCategory = cat;
          },
          record: record,
          amount: amount,
          onCancel: ()=> Navigator.of(context).pop(),
          onSave: () {
            setState(() {
              final iconData = categoryIcons[selectedCategory] ?? Icons.category;
              showChart = true;
              final double value = double.parse(amount.text).abs();
              
              if (value > 0) {
               // replace the map so Flutter detects change
              categoryTotals = Map<String, double>.from(categoryTotals);
              categoryTotals[selectedCategory] =
              (categoryTotals[selectedCategory] ?? 0) + value;
              }

              
              contain.add({
              'title': record.text,
              'subTitle': selectedCategory.isEmpty ? 'غير مصنف' : selectedCategory,
              'price': amount.text,
              'image': iconData,
              
              'priceColor':int.parse(amount.text) > 0
                  ? const Color.fromARGB(255, 209, 26, 26)
                  : Colors.green,
              });
              if (value > 0) {
              expenseTxt += value.abs();
              incomeTxt = balance;
              incomeTxt -= expenseTxt;
              count++;

              } else {
              incomeTxt += value;
              }
              selectedCategory = '';
              record.clear();
              amount.clear();
              Navigator.of(context).pop();
              durationTime = 1500;
            });
          },
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    final width =  MediaQuery.sizeOf(context).width;
    final height =  MediaQuery.sizeOf(context).height;
    return Scaffold(
      
      backgroundColor: appBg,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        actionsPadding: EdgeInsets.all(1),
        backgroundColor: appBg,
        actions: [
          /*
          ElevatedButton( 
            
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent
            ),
            onPressed: toggleThem,
            child:  Icon(Icons.wb_sunny_outlined , color: const Color.fromARGB(255, 255, 255, 255),),
            
            ),
            */
          ElevatedButton( 
            
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(

              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent
            ),
            onPressed: clear,
            child:  Icon(Icons.more_vert , color: const Color.fromARGB(255, 255, 255, 255),),
            
            ),
        ],
      ),
      body: ListView(
        children: [
          InfoContainer(bgtext: balance ,expenseTxt: expenseTxt, incomeTxt: incomeTxt,),
          Chart(showChart: showChart, data:categoryTotals, time:durationTime,),

          Padding(
            padding: const EdgeInsets.fromLTRB(30,5,15,5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 37, 37, 37),
                  ),
                  alignment: Alignment.center,
                  child: Text('$count' ,
                  style: TextStyle(
                    color: Colors.white
                  ),),
                ),
                Text('المعاملات الأخيرة',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                width: width ,
                height: height * 0.29,
                decoration: BoxDecoration(
                color: const Color.fromARGB(255, 37, 37, 37),
                borderRadius: BorderRadius.circular(10),
              ), 
              child: ListView.builder(
                itemCount: contain.length,
                itemBuilder: (context,index){
                  return ContainList(
                    title: contain[index]['title'],
                    subTitle: contain[index]['subTitle'],
                    price: contain[index]['price'],
                    image: contain[index]['image'],
                    priceColor: contain[index]['priceColor'],
                  );
                },
              ),
              ),
          ),

          

        ],
      ),

      floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 60, 60, 60),
          onPressed: addItem,
          child: Icon(Icons.add, color:Color.fromARGB(255, 255, 255, 255) ,),
        ),
    );
  }
}

