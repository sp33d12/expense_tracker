import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class Chart extends StatelessWidget {
  final bool showChart ;
  final Map<String, double> data;
  final int time;
  
  const Chart({super.key,
  required this.showChart ,
  required this.data,
  required this.time
  });
  @override
  Widget build(BuildContext context) {
    if (!showChart || data.isEmpty) return SizedBox.shrink();
    final Map<String, Color> categoryColors = {
  'نقل': Color(0xFF2979FF),
  'طعام': Color(0xFFFF6F00),
  'ونسة': Color.fromARGB(255, 255, 0, 128),
  'تسوق': Color(0xFF00C853),
  'صحة': Color(0xFFD50000),
  'أخرى': Color(0xFF616161),
};




    final width =  MediaQuery.sizeOf(context).width;
    final height =  MediaQuery.sizeOf(context).height;
    return Visibility(
      visible: showChart,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: width,
          height: height*0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 37, 37, 37),
          ),
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child:  PieChart(
                      PieChartData(
            sections: data.entries.map((e) {
              return PieChartSectionData(
                value: e.value,
                title: e.key,
                color: categoryColors[e.key] ?? Colors.grey,
                radius: 60,
                titlePositionPercentageOffset: 1.5,
                titleStyle: TextStyle(

                  color: Colors.white,
                  fontSize: 20,
                ),
              );
            }).toList(),
              
              ), 
            duration: Duration(milliseconds: time), 
            curve: Curves.ease,     
            ),
          ),
        ),
      ),
    );
  }
}