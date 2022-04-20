import 'package:flutter/material.dart';

import 'main.dart';

class EpworthScreen extends StatefulWidget {
  const EpworthScreen({Key? key}) : super(key: key);

  @override
  State<EpworthScreen> createState() => _EpworthScreenState();
}

class _EpworthScreenState extends State<EpworthScreen> {
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
              'Шкала Эпворта',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
