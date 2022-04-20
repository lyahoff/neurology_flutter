import 'package:flutter/material.dart';
import '../consciousness.dart';

class GlazgoScreen extends StatefulWidget {
  const GlazgoScreen({Key? key}) : super(key: key);

  @override
  State<GlazgoScreen> createState() => _GlazgoScreenState();
}

class _GlazgoScreenState extends State<GlazgoScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GlazgoLogic(),
    );
  }
}

class GlazgoLogic extends StatefulWidget {
  const GlazgoLogic({Key? key}) : super(key: key);

  @override
  State<GlazgoLogic> createState() => _GlazgoLogicState();
}

class _GlazgoLogicState extends State<GlazgoLogic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          runApp(const ConsciousnessScreen());
          return false;
        },
        child: Scaffold(
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
              'Шкала комы Глазго',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
