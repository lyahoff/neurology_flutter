import 'package:flutter/material.dart';

import 'main.dart';

class MidasScreen extends StatefulWidget {
  const MidasScreen({Key? key}) : super(key: key);

  @override
  State<MidasScreen> createState() => _MidasScreenState();
}

class _MidasScreenState extends State<MidasScreen> {
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
            'Шкала MIDAS',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
