// ignore_for_file: must_be_immutable


import 'package:expense_tracker/pages/main_page.dart';
import 'package:expense_tracker/util/colorss.dart';
import 'package:flutter/material.dart';


class IntroPage extends StatelessWidget {  


  final String text = 'سجل مصاريفك';

  final Color? bgText =  const Color.fromARGB(255, 255, 255, 255);

  final String subtext = 'تابع مصاريفك، واعرف مصير كل فلس';

  final Color? shText =  const Color.fromARGB(255, 255, 255, 255);

  final Color? inTxt = const Color.fromARGB(255, 255, 255, 255);

  final Color? bgBtnColor =const Color(0xFF2979FF);

  final Color? fgBtnColor =const Color(0xFFFFFFFF);

  final TextEditingController taBalance =  TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  
  
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w =  MediaQuery.sizeOf(context).width;
    final h =  MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: appBg ,
      body: Form(
      key: _formKey,
      child: Center(

        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            padding: EdgeInsets.fromLTRB(w *0.02 ,h*0.15,w *0.02,h*0.1),
            children: [
        
              // gif image 
              //Image(image: AssetImage('assets/fly.gif')),
              Padding(
                padding: const EdgeInsets.fromLTRB(90,10,90,10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blueAccent
                  ),
                  width: w *0.4,
                  height: h*0.2,
                  child:  Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 100,
                  color: Colors.white,
                  ),
                ),
              ),
        
              // Title text
              Padding(
                padding: const EdgeInsets.fromLTRB(90,30,80,0),
                child: Text(text ,style: TextStyle(
                  color: bgText,
                  fontSize: 30,
                ),),
              ),
        
              
              // sub Title text
              Padding(
                padding: const EdgeInsets.fromLTRB(50,5,50,25),
                child: Text(subtext
                ,style: TextStyle(
                  color: shText,
                  fontSize: 15,
                ),textAlign: TextAlign.center,
                ),
              ),
        
        
              // input Feild
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                  
                    controller:taBalance,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is required';
                      }
                          
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid integer';
                      }
                          
                      return null; 
                    },
                    style: TextStyle(
                      color: inTxt,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 3
                        )
                      ), 
                      hintStyle: TextStyle(
                        color: shText,
                        fontSize: 20
                      ),
                      hintText: "0 IQD",  
                      
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                ),
              ),
              
              
              // btn
              Padding(
                padding: const EdgeInsets.fromLTRB(50 ,20  ,50,20),
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: bgBtnColor,   // button color
                foregroundColor: fgBtnColor,  // text/icon color
                padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 18),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
                ),
                onPressed: (){
                if (_formKey.currentState!.validate()) {
                double value = double.parse(taBalance.text);
        
                Navigator.push(
                
                context,
                MaterialPageRoute(
                  builder: (_) => MainPage(totalBalance: value,),
                ),
                
                );
                }
                }, 
                child: Text('ابدأ الآن' , style: TextStyle(
                  fontSize: 20
                ),)),
              )
            ],
          ),
        ),
      ),
            ));
  }
}