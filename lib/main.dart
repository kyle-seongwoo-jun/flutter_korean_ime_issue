import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final List<(DateTime, String)> _histories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _histories.clear();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _histories.add((DateTime.now(), value));
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _histories.length,
              itemBuilder: (context, index) {
                final (time, text) = _histories[index];
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(width: 250, child: Text(time.toString())),
                    Text(text),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
