import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final salariuController = TextEditingController();

  String tipAngajat = "angajat";

  double impozit = 0;
  double salariuNet = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink.shade50,

        body: Padding(
          padding: EdgeInsets.only(
            top: 110 ,
            left: 20,
            right: 20,
          ),

          child: Column(
            children: [


              Text(
                "Calculator pentru Salariu",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30),

              TextField(
                controller: salariuController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Salariu brut",
                  hintText: "Introdu salariu",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),


              Text(
                "Tip angajat",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                children: [
                  Radio<String>(
                    value: "angajat",
                    groupValue: tipAngajat,
                    onChanged: (value) {
                      setState(() {
                        tipAngajat = value!;
                      });
                    },
                  ),
                  Text("Angajat"),
                ],
              ),

              Row(
                children: [
                  Radio<String>(
                    value: "angajait",
                    groupValue: tipAngajat,
                    onChanged: (value) {
                      setState(() {
                        tipAngajat = value!;
                      });
                    },
                  ),
                  Text("Angajat IT"),
                ],
              ),

              SizedBox(height: 10),


              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      double salariu =double.parse(salariuController.text);

                      if (tipAngajat == "angajat") {
                        impozit = salariu * 0.12;
                      } else {
                        impozit = 0;

                      }

                      salariuNet = salariu - impozit;
                    });
                  },

                  child: Text(
                    "Calculează",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

                    Text(
                      "Salariu net: ${salariuNet.toStringAsFixed(2)} lei",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Impozit: ${impozit.toStringAsFixed(2)} lei",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
          ),
    );
  }
}