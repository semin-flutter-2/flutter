import 'package:flutter/material.dart';

// stful
class CounterScreen extends StatefulWidget {
  const CounterScreen({Key key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카운터'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Text(
        '0',
        style: TextStyle(fontSize: 48),
      ),
    );
  }
}
