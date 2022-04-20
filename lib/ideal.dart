import 'package:flutter/material.dart';

import 'main.dart';

class IdealBodyMassScreen extends StatefulWidget {
  const IdealBodyMassScreen({Key? key}) : super(key: key);

  @override
  State<IdealBodyMassScreen> createState() => _IdealBodyMassScreenState();
}

class _IdealBodyMassScreenState extends State<IdealBodyMassScreen> {
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
              'Идеальная масса тела',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
