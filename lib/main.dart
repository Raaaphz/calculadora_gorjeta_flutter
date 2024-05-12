import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CALCULAR GORJETA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CALCULADORA DE GORJETA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _conta = TextEditingController();
  double _gorjeta = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'INSIRA O VALOR DA CONTA: ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _conta,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        double _valorConta = double.parse(_conta.text);
                        setState(() {
                          _gorjeta = _valorConta * 0.1;
                        });
                      },
                      child: const Text('10%'),
                    ),

                    const SizedBox(height: 30),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        double _valorConta = double.parse(_conta.text);
                        setState(() {
                          _gorjeta = _valorConta * 0.15;
                        });
                      },
                      child: const Text('15%'),
                    ),

                    const SizedBox(height: 30),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        double _valorConta = double.parse(_conta.text);
                        setState(() {
                          _gorjeta = _valorConta * 0.2;
                        });
                      },
                      child: const Text('20%'),
                    ),
                  ]
              ),
            ),
            Text("O valor da gorjeta será: $_gorjeta ",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
