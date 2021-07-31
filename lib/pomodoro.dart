import 'dart:async';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';

class pomodoro extends StatefulWidget {
  const pomodoro({Key? key}) : super(key: key);

  @override
  _pomodoroState createState() => _pomodoroState();
}

class _pomodoroState extends State<pomodoro> {
  Map data = {};
  late Timer _timer;
  late int _start;
  void startTimer() {
    print('STARTED TIMER');
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    _start = data['time'] * 60;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text('Pomodoro'),
        ),
      ),
      body: Container(
          color: Colors.blueGrey,
          child: Center(
            child: CustomTimer(
              from: Duration(minutes: data['time']),
              to: Duration(minutes: 0),
              onBuildAction: CustomTimerAction.auto_start,
              builder: (CustomTimerRemainingTime remaining) {
                return Text(
                  "${remaining.hours}:${remaining.minutes}:${remaining.seconds}",
                  style: TextStyle(fontSize: 30.0),
                );
              },
            ),
          )),
    );
  }

  void back() {
    Navigator.pop(context);
  }
}
