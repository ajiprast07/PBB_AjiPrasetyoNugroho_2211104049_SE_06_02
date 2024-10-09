import 'package:flutter/material.dart';
import 'package:pertemuan_4/gridview.dart';
import 'package:pertemuan_4/listview.dart';
import 'package:pertemuan_4/stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StackScreen());

    // StackScreen());

    // ListViewScreen());

    // GridviewAji());
  }
}
