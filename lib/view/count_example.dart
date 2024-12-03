import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    print('full rebuild');
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(
          child: Consumer<CountProvider>(builder: (context, value, child){
            print('only value rebuild');
            return Text(value.count.toString(), style: TextStyle(fontSize: 50),);
          })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
