import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

//TODO: clean up the widgets
class SelectTimer extends StatefulWidget {
  @override
  _SelectTimerState createState() => _SelectTimerState();
}

class _SelectTimerState extends State<SelectTimer> {
  void loadtime() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text('Pomodoro'),
        ),
      ),
      body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        timepicker(),
      ])),
    );
  }
}

class timepicker extends StatefulWidget {
  int timestampe = 0;
  @override
  _timepickerState createState() => _timepickerState();
}

class _timepickerState extends State<timepicker> {
  int _currentHours = 0;
  int _currentMinutes = 45;
  int _resttime = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    maxValue: 9,
                    step: 1,
                    haptics: false,
                    selectedTextStyle:
                        TextStyle(color: Colors.teal, fontSize: 30),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(), bottom: BorderSide()),
                    ),
                    onChanged: (value) => setState(() => _currentHours = value),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Column(
                children: <Widget>[
                  Text('Minutes', style: TextStyle(color: Colors.white)),
                  NumberPicker(
                    textStyle: TextStyle(color: Colors.white),
                    value: _currentMinutes,
                    selectedTextStyle:
                        TextStyle(color: Colors.teal, fontSize: 30),
                    minValue: 1,
                    maxValue: 59,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(), bottom: BorderSide()),
                    ),
                    step: 1,
                    haptics: false,
                    onChanged: (value) =>
                        setState(() => _currentMinutes = value),
                  ),
                ],
              ),
            ],
          ),
          NumberPicker(
            axis: Axis.horizontal,
            textStyle: TextStyle(color: Colors.white),
            value: _resttime,
            selectedTextStyle: TextStyle(color: Colors.teal, fontSize: 30),
            minValue: 1,
            maxValue: 20,
            decoration: BoxDecoration(
              border: Border(left: BorderSide(), right: BorderSide()),
            ),
            step: 1,
            haptics: false,
            onChanged: (value) => setState(() => _resttime = value),
          ),
          IconButton(
            onPressed: addtime,
            icon: Icon(Icons.add_alarm_sharp),
          ),
        ],
      ),
    );
  }

  void addtime() {
    widget.timestampe = _currentHours * 60 + _currentMinutes;
    Navigator.pushNamed(context, '/home',
        arguments: {'time': widget.timestampe, 'rest': _resttime});
  }
}
