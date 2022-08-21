import 'package:flutter/material.dart';
import 'package:bmi_application/widgets/left_bar.dart';
import 'package:bmi_application/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(
                color: Colors.amberAccent, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 21, 40, 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 140,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w300,
                          color: Colors.amberAccent),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter height",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 140,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w300,
                          color: Colors.amberAccent),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter weight",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = "You\'re over weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "You have normal weight";
                    } else {
                      _textResult = "You\'re under weight";
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(115, 26, 25, 25),
                        blurRadius: 2,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    "  Calculate  ",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 72, color: Colors.amberAccent),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.amberAccent),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 70),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 70),
              SizedBox(
                height: 30,
              ),
              RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
