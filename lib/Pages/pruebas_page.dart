import 'package:arrow_pad/arrow_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robotsumo/components/data.dart';

import '../components/joystick_mode_dropdown.dart';

class PruebasPage extends StatefulWidget {
  const PruebasPage({Key? key}) : super(key: key);

  @override
  _PruebasPageState createState() => _PruebasPageState();
}

class _PruebasPageState extends State<PruebasPage> {
  double _x = 100;
  double _y = 100;
  JoystickMode _joystickMode = JoystickMode.all;
  bool _wasClicked = false;

  @override
  void didChangeDependencies() {
    _x = MediaQuery.of(context).size.width / 2 - ballSize / 2;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorPage,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Joystick'),
        actions: [
          JoystickModeDropdown(
            mode: _joystickMode,
            onChanged: (JoystickMode value) {
              setState(() {
                _joystickMode = value;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: const Alignment(0, 0),
              child: IconButton(
                iconSize: 100,
                color: Colors.amber,
                highlightColor: Colors.blueAccent,
                onPressed: (){},
                icon: const Icon(Icons.public_sharp, size: 100,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}