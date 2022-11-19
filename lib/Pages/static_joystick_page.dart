import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robotsumo/components/data.dart';

import '../components/joystick_mode_dropdown.dart';

class StaticJoystickPage extends StatefulWidget {
  const StaticJoystickPage({Key? key}) : super(key: key);

  @override
  _StaticJoystickPageState createState() => _StaticJoystickPageState();
}

class _StaticJoystickPageState extends State<StaticJoystickPage> {
  double _x = 100;
  double _y = 100;
  JoystickMode _joystickMode = JoystickMode.all;

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
        child: Stack(
          children: [
            Container(
              color: Colors.deepPurple[200],
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: Joystick(
                mode: _joystickMode,
                listener: (details) {
                  setState(() {
                    _x = _x + step * details.x;
                    _y = _y + step * details.y;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}