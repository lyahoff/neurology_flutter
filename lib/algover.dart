import 'package:flutter/material.dart';

import 'main.dart';

class AlgoverScreen extends StatefulWidget {
  const AlgoverScreen({Key? key}) : super(key: key);

  @override
  State<AlgoverScreen> createState() => _AlgoverScreenState();
}

class _AlgoverScreenState extends State<AlgoverScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              runApp(const MainScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Индекс Альговера',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
