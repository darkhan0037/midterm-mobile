import 'package:flutter/material.dart';
import 'package:midterm/button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var userQues = '';
  var userAns = '';

  final List<String> buttons =
      [
        'C', '+/-', '%', '/',
        '9', '8', '7', 'x',
        '6', '5', '4', '-',
        '3', '2', '1', '+',
        '0', '.', '.', '=',
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 39,),
                  Container(
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.centerRight,
                      child: Text(userQues, style: TextStyle(fontSize: 25),)),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                      child: Text(userAns, style: TextStyle(fontSize: 25),))
                ],
              ),
          ),
          ),
          Expanded(
            flex: 2,
            child: Container(
            child: GridView.builder(
              itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index){
                if(index == 0){
                  return CalcButton(
                      bTapped: (){
                        setState(() {
                          userQues = '';
                        });
                      },
                      bText: buttons[index],
                      color: Colors.grey.shade700,
                      textColor: Colors.white,
                  );
                  }else if(index==1){
                  return CalcButton(
                    bText: buttons[index],
                    color: Colors.grey.shade700,
                    textColor: Colors.white,
                  );
                }
                else if(index==2){
                  return CalcButton(
                    bText: buttons[index],
                    color: Colors.grey.shade700,
                    textColor: Colors.white,
                  );
                }
                //Equal
                else if (index == buttons.length-1){
                  return CalcButton(
                    bTapped: (){
                      setState(() {
                        equalPressed();
                      });
                    },
                    bText: buttons[index],
                    color: isOperator(buttons[index]) ? Colors.orange : Colors.grey.shade600,
                    textColor: Colors.white,
                  );
                }

                else{
                  return CalcButton(
                    bTapped: (){
                      setState(() {
                        userQues +=  buttons[index];
                      });
                    },
                    bText: buttons[index],
                    color: isOperator(buttons[index]) ? Colors.orange : Colors.grey.shade600,
                    textColor: Colors.white,
                  );
                }
                }),
              ),
            ),
        ],
      ),
    );
  }
  bool isOperator(String x){
    if(x=='/' || x=='x' || x=='-' || x=='+' || x=='='){
      return true;
    }
    return false;
  }

    void equalPressed(){
    String finalQues = userQues;
    finalQues = finalQues.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQues);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAns = eval.toString();
    }
}
