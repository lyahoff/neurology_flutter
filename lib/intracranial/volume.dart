import 'package:flutter/material.dart';
import 'package:neurology_flutter/intracranial.dart';

class VulumeScreen extends StatefulWidget {
  const VulumeScreen({Key? key}) : super(key: key);

  @override
  State<VulumeScreen> createState() => _VulumeScreenState();
}

class _VulumeScreenState extends State<VulumeScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VolumeLogic(),
    );
  }
}

class VolumeLogic extends StatefulWidget {
  const VolumeLogic({Key? key}) : super(key: key);

  @override
  State<VolumeLogic> createState() => _VolumeLogicState();
}

class _VolumeLogicState extends State<VolumeLogic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              runApp(const IntracranialScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Расчет объема внутричерепного кровоизлияния',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
