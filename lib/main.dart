import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Cálculo de IMC")),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Formulario()
            ],
          ),
        )
      )
    );
  }
}

class Formulario extends StatelessWidget {

  final _nome = TextEditingController();
  final _phone = TextEditingController();
  final _sexo = TextEditingController();
  final _peso = TextEditingController();
  final _altura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            controller: _nome,
            style: TextStyle(
              fontSize: 24.0 
            ),
            decoration: InputDecoration(
              labelText: "Nome:",
              icon: Icon(Icons.account_box)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            controller: _phone,
            style: TextStyle(
              fontSize: 24.0 
            ),
            decoration: InputDecoration(
              labelText: "Telefone:",
              icon: Icon(Icons.phone)
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            controller: _sexo,
            style: TextStyle(
              fontSize: 24.0 
            ),
            decoration: InputDecoration(
              labelText: "Sexo:",
              icon: Icon(Icons.portrait)
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            controller: _peso,
            style: TextStyle(
              fontSize: 24.0 
            ),
            decoration: InputDecoration(
              labelText: "Peso:",
              icon: Icon(Icons.restaurant_menu)
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            controller: _altura,
            style: TextStyle(
              fontSize: 24.0 
            ),
            decoration: InputDecoration(
              labelText: "Altura:",
              icon: Icon(Icons.portrait)
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        RaisedButton(
          child: Text("Calcular",
            style: TextStyle(color: Colors.white, fontSize: 30.0)
          ),
          color: Colors.green,
          highlightColor: Colors.yellow[300],
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                if (_sexo.text != "Feminino" && _sexo.text != "Masculino")
                  return Alert("Erro", "Informe os valores 'Feminino' ou 'Masculino' no campo 'Sexo'.");
                else {
                  double alt = double.parse(_altura.text);
                  double peso = double.parse(_peso.text);
                  double res = peso / (alt * alt);
                  String imc = res.round().toString();
                  String resultado = "Abaixo do Peso.";

                  if (res >= 40)
                    resultado = "com Obesidade grau 3.";
                  else if (res >= 35)
                    resultado = "com Obesidade grau 2.";
                  else if (res >= 30)
                    resultado = "com Obesidade grau 1.";
                  else if (res >= 25)
                    resultado = "com Sobrepeso.";
                  else if (res >= 18.5)
                    resultado = "com Peso normal.";

                  return Alert("Sucesso", _nome.text + ", seu IMC é: " + imc + "\n\nVocê está " + resultado);
                }
              }
            );
          },
        )
      ],
    );
  }
}

class Alert extends StatelessWidget {

  final String _title;
  final String _message;

  Alert(this._title, this._message);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$_title'),
      content: Text('$_message'),
      actions: <Widget>[
        FlatButton(
          child: new Text("Fechar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}