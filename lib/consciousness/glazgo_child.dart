import 'package:flutter/material.dart';
import '../consciousness.dart';

class GlazgoChildrenScreen extends StatefulWidget {
  const GlazgoChildrenScreen({Key? key}) : super(key: key);

  @override
  State<GlazgoChildrenScreen> createState() => _GlazgoChildrenScreenState();
}

class _GlazgoChildrenScreenState extends State<GlazgoChildrenScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GlazgoChildrenLogic(),
    );
  }
}

class GlazgoChildrenLogic extends StatefulWidget {
  const GlazgoChildrenLogic({Key? key}) : super(key: key);

  @override
  State<GlazgoChildrenLogic> createState() => _GlazgoChildrenLogicState();
}

class _GlazgoChildrenLogicState extends State<GlazgoChildrenLogic> {
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
              'Детская шкала комы Глазго',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
