import 'package:flutter/material.dart';
import '../consciousness.dart';

class RichmindScreen extends StatefulWidget {
  const RichmindScreen({Key? key}) : super(key: key);

  @override
  State<RichmindScreen> createState() => _RichmindScreenState();
}

class _RichmindScreenState extends State<RichmindScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RichmondLogic(),
    );
  }
}

class RichmondLogic extends StatefulWidget {
  const RichmondLogic({Key? key}) : super(key: key);

  @override
  State<RichmondLogic> createState() => _RichmondLogicState();
}

class _RichmondLogicState extends State<RichmondLogic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              runApp(const ConsciousnessScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Шкала возбуждения-седации Ричмонда',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
