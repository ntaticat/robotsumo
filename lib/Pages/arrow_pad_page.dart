import 'package:arrow_pad/arrow_pad.dart';
import 'package:flutter/material.dart';

class ArrowPadPage extends StatefulWidget {
  const ArrowPadPage({Key? key}) : super(key: key);

  @override
  _ArrowPadPageState createState() => _ArrowPadPageState();
}

class _ArrowPadPageState extends State<ArrowPadPage> {
  String _secondArrowPadValue = 'With Functions';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrow Pad Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Switch(value: true, onChanged: null),
            ArrowPad(
              padding: const EdgeInsets.all(8.0),
              height: height / 1.25,
              width: width / 1.25,
              arrowPadIconStyle: ArrowPadIconStyle.chevron,
              // hoverColor: Colors.green,
              iconColor: Colors.white,
              outerColor: Colors.blue[500],
              innerColor: Colors.white70,
              splashColor: Colors.blue[300],
              onPressedUp: () {
                setState(() {
                  _secondArrowPadValue = 'Up Pressed';
                });
              },
              onPressedDown: () {
                setState(() {
                  _secondArrowPadValue = 'Down Pressed';
                });
              },
              onPressedLeft: () {
                setState(() {
                  _secondArrowPadValue = 'Left Pressed';
                });
              },
              onPressedRight: () {
                setState(() {
                  _secondArrowPadValue = 'Right Pressed';
                });
              },
            ),
            Text(_secondArrowPadValue),
          ],
        ),
      ),
    );
  }
}