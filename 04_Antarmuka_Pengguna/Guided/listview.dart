import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan List View'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
            child: Center(
              child: Text("Type A"),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.blue,
            child: Center(
              child: Text("Type B"),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.yellow,
            child: Center(
              child: Text("Type C"),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.black,
            child: Center(
              child: Text("Type D"),
            ),
          ),
        ],
      ),
    );
  }
}
