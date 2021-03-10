import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String bText;
  final color;
  final textColor;
  final bTapped;
  CalcButton({this.bText, this.color, this.textColor, this.bTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: bTapped,
     child: Padding(padding: const EdgeInsets.all(0.5),
      child: ClipRRect(
       child: Container(
         color: color,
         child: Center(child: Text(bText, style: TextStyle(color: textColor, fontSize: 25),),),
       ),
      ),
    ),
    );
  }
}
