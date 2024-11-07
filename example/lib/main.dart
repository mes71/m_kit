import 'package:MKit/m_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'dast',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    MLogger.log("Hello, MKit!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Example M kit"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "سلام برتو این یک تست است1 2 3 4 5 6 7 8 9 0",
                style: TextStyle(
                  fontFamily: 'dast',
                ),
              ),
              SizedBox(height: 20),
              MTextField(
                hintText: "سلام برتو این یک تست است",
                label: "سلام ",
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  MLogger.log(value);
                },
              ),
              MTextField.noBorder(
                hintText: "Enter your name",
                label: "سلام برتو این یک تست است",
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  MLogger.log(value);
                },
              ),
              SizedBox(height: 20),
              MTextField.password(
                label: "password",
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  MLogger.log(value);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
