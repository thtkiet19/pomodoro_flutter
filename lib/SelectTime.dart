import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

//TODO: clean up the widgets
class SelectTimer extends StatefulWidget {
  // late final int timestampe;
  // SelectTimer({required Key Key, required this.timestampe});

  @override
  _SelectTimerState createState() => _SelectTimerState();
}

class _SelectTimerState extends State<SelectTimer> {
  int _currentHours = 0;

  int _currentMinutes = 45;
  int timestampe = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text('Pomodoro'),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: <Widget>[
                          Text('Hours', style: TextStyle(color: Colors.white)),
                          NumberPicker(
                            textStyle: TextStyle(color: Colors.white),
                            value: _currentHours,
                            minValue: 0,
                            maxValue: 60,
                            step: 1,
                            haptics: true,
                            selectedTextStyle:
                                TextStyle(color: Colors.teal, fontSize: 30),
                            decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(), bottom: BorderSide()),
                            ),
                            onChanged: (value) =>
                                setState(() => _currentHours = value),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        children: <Widget>[
                          Text('Minutes',
                              style: TextStyle(color: Colors.white)),
                          NumberPicker(
                            textStyle: TextStyle(color: Colors.white),
                            value: _currentMinutes,
                            selectedTextStyle:
                                TextStyle(color: Colors.teal, fontSize: 30),
                            minValue: 0,
                            maxValue: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(), bottom: BorderSide()),
                            ),
                            step: 1,
                            haptics: true,
                            onChanged: (value) =>
                                setState(() => _currentMinutes = value),
                          ),
                        ],
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: search(),
                    child: Text('begin'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  search() {
    timestampe = _currentHours * 60 + _currentMinutes;
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {'timestampe': timestampe});
  }
}
