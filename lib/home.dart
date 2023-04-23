import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {


  final _HomeState home = _HomeState();
  String get imc => home.imc;
  double get weight => home.weight_out;
  double get height => home.height_out;

  void calculate(){
    home._calculate();
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoText = "Informe seus dados!";
  double weight_out = 100;
  double height_out = 170;
  String imc = '';

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if(imc < 18.6){
        _infoText = "Abaixo do Peso \n(${imc.toStringAsPrecision(4)})";
        weight_out = weight;
        height_out = height;
      } else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso Ideal \n(${imc.toStringAsPrecision(4)})";
        weight_out = weight;
        height_out = height;
      } else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente Acima do Peso \n(${imc.toStringAsPrecision(4)})";
        weight_out = weight;
        height_out = height;
      } else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade Grau I \n(${imc.toStringAsPrecision(4)})";
        weight_out = weight;
        height_out = height;
      } else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obesidade Grau II \n(${imc.toStringAsPrecision(4)})";
        weight_out = weight;
        height_out = height;
      } else if(imc >= 40){
        _infoText = "Obesidade Grau III \n(${imc.toStringAsPrecision(4)})";
        weight_out = weight;
        height_out = height;
      }
    }

    );
    imc = _infoText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              const SizedBox(
                width: 20,
                height: 20,
              ),

              Icon(Icons.person_outline, size: 120.0, color: Colors.blueAccent),

              const SizedBox(
                width: 20,
                height: 20,
              ),

              TextFormField(
                key: Key("peso"),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.blueAccent)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Insira seu Peso!";
                  }
                },
              ),
              TextFormField(
                key: Key("altura"),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.blueAccent)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Insira sua Altura!";
                  }
                },
              ),

              const SizedBox(
                width: 20,
                height: 20,
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        _calculate();
                      }
                    },
                    child: Text(
                        "Calcular",
                        style: GoogleFonts.aladin(color: Colors.white,
                            fontSize: 25.0)),
                  ),
                ),
              ),

              const SizedBox(
                width: 20,
                height: 20,
              ),

              Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aladin(color: Colors.blueAccent,
                      fontSize: 25.0)),

              const SizedBox(
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}