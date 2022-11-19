import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class JoystickModeDropdown extends StatelessWidget {
  final JoystickMode mode;
  final ValueChanged<JoystickMode> onChanged;

  const JoystickModeDropdown(
      {Key? key, required this.mode, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: FittedBox(
          child: DropdownButton(
            dropdownColor: Colors.deepPurple[400],
            value: mode,
            onChanged: (v) {
              onChanged(v as JoystickMode);
            },
            items: const [
              DropdownMenuItem(
                  value: JoystickMode.all,
                  child: Text('All Directions', style: TextStyle(color: Colors.white),)),
              DropdownMenuItem(
                  value: JoystickMode.horizontalAndVertical,
                  child: Text('Vertical And Horizontal', style: TextStyle(color: Colors.white),)),
              DropdownMenuItem(
                  value: JoystickMode.horizontal,
                  child: Text('Horizontal', style: TextStyle(color: Colors.white),)),
              DropdownMenuItem(
                  value: JoystickMode.vertical,
                  child: Text('Vertical', style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      ),
    );
  }
}