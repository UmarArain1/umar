import 'package:flutter/material.dart';

void main() {
  runApp(const TipCalculator());
}

class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) : super(key: key);

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  final controller = TextEditingController();
  List<bool> selection = [
    true, false, false,
  ];
  String? tip;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             if(tip!=null)
                 Text(
                   '\$ $tip ',
                   style: TextStyle(
                     fontSize: 30.0,
                     fontWeight: FontWeight.bold,
                   ),

                 ),

              Text(
                'Total Amount',

              ),
              SizedBox(
                width: 70.0,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: '\$100',

                  ),


                ),
              ),
              ToggleButtons(children: [Text('10%'), Text('15%'), Text('20%'),],
                isSelected: selection,
                onPressed: selecter,
              ),

              TextButton(onPressed: tip_calculatoing,
                  child: Text(
                    'Calculate Tip', style: TextStyle(color: Colors.white,),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent)
              ),
              )


            ],
          ),
        ),

      ),
    );
  }
  void tip_calculatoing()
  {
    final totalamount= double.parse(controller.text);
    final selcted= selection.indexWhere((element) => element);
    final percentage= [.1, .15, .2][selcted];
    final totaltip=(totalamount*percentage).toStringAsFixed(2);
    setState(() {
      tip=totaltip;
    });
  }

  void selecter(int s){
    setState(() {
      for (int i = 0; i < selection.length; i++) {
        selection[i] = s == i;
      }
    });
  
}
  
}



