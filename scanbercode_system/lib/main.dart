import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan Barcode',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Scan Barcode'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "ยังไม่มีข้อมูล";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Result",
                            style: TextStyle(
                                fontSize: 30, color: Colors.purple.shade300)),
                        SizedBox(height: 10),
                        Text(
                          result,
                          style: TextStyle(
                              fontSize: 25, color: Colors.blue.shade400),
                        )
                      ],
                    ),
                  ),
                ))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Startscan,
        child: Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Startscan() async {
    String cameraScanResult = (await scanner.scan()).toString();
    setState(() {
      result = cameraScanResult;
    });
  }
}
