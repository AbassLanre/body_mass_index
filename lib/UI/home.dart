import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

//  final TextEditingController _ageController= TextEditingController();
  double bmi = 0;
  double heightMetres;
  String weightRange = "";

//  void submit() {
//    setState(() {
//      calculateBmi(_heightController.text, _weightController.text);
//      if (bmi <= 18.5) {
//        weightRange = "Underweight";
//      } else if (bmi <= 25.0 && bmi > 18.5) {
//        weightRange = "Normal";
//      } else if (bmi <30 && bmi > 25.0) {
//        weightRange = "Overweight";
//      } else {
//        weightRange = "Obese";
//      }
//    });
//  }

  ///////   OR
  void calculateAndSubmitBmi(){
    setState(() {
      double height =double.parse(_heightController.text);
      double weight =double.parse(_weightController.text);
      heightMetres = height / 100;
      bmi = weight / (heightMetres * heightMetres);
      if (bmi <= 18.5) {
        weightRange = "Underweight";
      } else if (bmi <= 25.0 && bmi > 18.5) {
        weightRange = "Normal";
      } else if (bmi <30 && bmi > 25.0) {
        weightRange = "Overweight";
      } else {
        weightRange = "Obese";
      }
    });
  }
//  double calculateBmi(String height, String weight) {
//    // BMI is kg/m(squared)
//    // 1 foot = 0.3048m
//    heightMetres = double.parse(height) / 100;
//    bmi = double.parse(weight) / (heightMetres * heightMetres);
//    return bmi;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              "images/bmilogo.png",
              height: 100,
              width: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Wrap(
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.all(3.0),
                      color: Colors.black12,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextField(
//                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Age",
                                icon: Icon(Icons.person_outline),
                              ),
                            ),
                            TextField(
                              controller: _heightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Height in Cm",
                                icon: Icon(Icons.assessment),
                              ),
                            ),
                            TextField(
                              controller: _weightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Weight in Kg",
                                icon: Icon(Icons.dehaze),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                onPressed: calculateAndSubmitBmi,
                                child: Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.redAccent,
                              ),
                            )
                          ])),
                ],
              ),
            ),
          ),
          Text(
            bmi.toString().isEmpty || bmi <= 0
                ? ""
                : "Your BMI is: ${bmi.toStringAsFixed(1)}",
            style: TextStyle(
                color: bmi >= 30 ? Colors.red : Colors.green,
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
          Text(
            weightRange,
            style: TextStyle(
                color: bmi >= 30 ? Colors.redAccent : Colors.green,
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
