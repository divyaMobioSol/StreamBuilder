import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  final StreamController<int> _controller = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Streams')),
      body: StreamBuilder(
          initialData: '0',
          stream: _controller.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(
                  snapshot.data.toString(),
                  style: const TextStyle(fontSize: 70),
                ),
              );
            } else {
              const Center(
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 60),
                ),
              );
            }
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            counter++;
            _controller.sink.add(counter);
          }),
    );
  }
}
