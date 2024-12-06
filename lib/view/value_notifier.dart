import 'package:flutter/material.dart';

class Counter {
  final ValueNotifier<int> count = ValueNotifier<int>(0);

  void incrementCount() {
    count.value++;
  }
}

class ValueNotifierApp extends StatefulWidget {
  @override
  _ValueNotifierAppState createState() => _ValueNotifierAppState();
}

class _ValueNotifierAppState extends State<ValueNotifierApp> {
  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count:',
            ),
            ValueListenableBuilder<int>(
              valueListenable: counter.count,
              builder: (BuildContext context, int value,child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter.incrementCount();
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}