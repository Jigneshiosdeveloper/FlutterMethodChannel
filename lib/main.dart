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
      title: 'Flutter Method Channel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Method Channel'),
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
  static const MethodChannel _channel = const MethodChannel('method_channel_flutter');
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("$result",style: const TextStyle(fontSize: 16)),
            ElevatedButton(
              onPressed: (){
                callAdditionNumbers();
              },
              child: const Text('Get Result'),
            ),

          ],
        ),
      ),
    );
  }

  void callAdditionNumbers() async {
    var returnValue = await _channel.invokeMethod("multiplynumbers", <String, dynamic>{
      'num1': 10,
      'num2': 20,
    });
    print("RESULT $returnValue");
    setState(() {
      result = returnValue["Multiply"];
    });
  }
}
