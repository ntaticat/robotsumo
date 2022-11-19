
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robotsumo/components/data.dart';
import 'package:robotsumo/components/joystick_mode_dropdown.dart';

class AreaJoystickPage extends StatefulWidget {
  const AreaJoystickPage({Key? key}) : super(key: key);

  @override
  _AreaJoystickPageState createState() => _AreaJoystickPageState();
}

class _AreaJoystickPageState extends State<AreaJoystickPage> {
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
        title: const Text('Joystick Area'),
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
        child: JoystickArea(
          mode: _joystickMode,
          initialJoystickAlignment: const Alignment(0, 0.0),
          listener: (details) {
            setState(() {
              _x = _x + step * details.x;
              _y = _y + step * details.y;
            });
          },
          child: Stack(
            children: [
              Container(
                color: backgroundColorPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
