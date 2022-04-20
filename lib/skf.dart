import 'package:flutter/material.dart';

import 'main.dart';

class SkfScreen extends StatefulWidget {
  const SkfScreen({Key? key}) : super(key: key);

  @override
  State<SkfScreen> createState() => _SkfScreenState();
}

class _SkfScreenState extends State<SkfScreen> {
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
              'Калькулятор СКФ и клиренса креатинина',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
