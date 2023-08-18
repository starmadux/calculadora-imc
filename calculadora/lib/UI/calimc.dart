import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Calculadora IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  var resultadoFinal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 84, 169, 238),
        title: Text(widget.title),
      ),
      backgroundColor: Color.fromARGB(255, 87, 127, 187),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/imc-.png',
                  height: 110.0,
                ),
              ),
              TextFormField(
                controller: controllerPeso,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                  hintText: 'Digite seu peso',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerAltura,
                decoration: const InputDecoration(
                  labelText: 'Altura',
                  hintText: 'Digite sua altura',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                resultadoFinal,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      double peso = double.parse(controllerPeso.text);
                      double altura = double.parse(controllerAltura.text);
                      double x = peso / (altura * altura);
                      resultadoFinal = x.toStringAsFixed(2);
                    });
                  },
                  child: const Text('Calcular'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
