import 'package:flutter/material.dart';

class GridviewAji extends StatefulWidget {
  const GridviewAji({super.key});

  @override
  State<GridviewAji> createState() => _GridviewAjiState();
}

class _GridviewAjiState extends State<GridviewAji> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Icon(Icons.add),
                Text('GridView 1'),
              ],
            ),
            color: Colors.amberAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text('GridView 2'),
                Icon(Icons.ac_unit),
              ],
            ),
            color: Colors.blueGrey,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView 3'),
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView 4'),
            color: Colors.cyan,
          )
        ],
      ),
    );
  }
}
