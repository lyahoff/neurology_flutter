import 'package:flutter/material.dart';

import 'main.dart';

class HantScreen extends StatefulWidget {
  const HantScreen({Key? key}) : super(key: key);

  @override
  State<HantScreen> createState() => _HantScreenState();
}

class _HantScreenState extends State<HantScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          runApp(const MainScreen());
          return false;
        },
        child: Scaffold(
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
              'Шкала Ханта-Хесса',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
