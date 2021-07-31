import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pomodoro extends StatefulWidget {
  const pomodoro({Key? key}) : super(key: key);

  @override
  _pomodoroState createState() => _pomodoroState();
}

class _pomodoroState extends State<pomodoro> {
  Map data = {};

  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
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
            child: Column(
              children: [
                maintime(
                  time: data['time'],
                  restTime: data['rest'],
                ),
              ],
            ),
          )),
    );
  }

  void back() {
    Navigator.pop(context);
  }
}

class maintime extends StatefulWidget {
  late final int time;
  late final int restTime;
  late int counter = 0;
  late int _time = 0;

  CountDownController _controller = CountDownController();
  maintime({Key? key, required int this.time, required this.restTime})
      : super(key: key);

  @override
  _maintimeState createState() => _maintimeState();
}

class _maintimeState extends State<maintime> {
  int timealter(int counter) {
    if (counter % 2 == 0) {
      print(counter);
      return widget.time;
    } else {
      print(counter);
      return widget.restTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    widget._time = timealter(widget.counter);
    print(widget._time);
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width / 3,
        ),
        CircularCountDownTimer(
          // Countdown duration in Seconds.
          duration: widget._time * 60,

          // Countdown initial elapsed Duration in Seconds.
          initialDuration: 0,

          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
          controller: widget._controller,

          // Width of the Countdown Widget.
          width: MediaQuery.of(context).size.width / 2,

          // Height of the Countdown Widget.
          height: MediaQuery.of(context).size.height / 2,

          // Ring Color for Countdown Widget.
          ringColor: Colors.grey[300]!,

          // Ring Gradient for Countdown Widget.
          ringGradient: null,

          // Filling Color for Countdown Widget.
          fillColor: Colors.cyan,

          // Filling Gradient for Countdown Widget.
          fillGradient: null,

          // Background Color for Countdown Widget.
          backgroundColor: Colors.teal,

          // Background Gradient for Countdown Widget.
          backgroundGradient: null,

          // Border Thickness of the Countdown Ring.
          strokeWidth: 20.0,

          // Begin and end contours with a flat edge and no extension.
          strokeCap: StrokeCap.round,

          // Text Style for Countdown Text.
          textStyle: TextStyle(
              fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),

          // Format for the Countdown Text.
          textFormat: CountdownTextFormat.HH_MM_SS,

          // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
          isReverse: true,

          // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
          isReverseAnimation: false,

          // Handles visibility of the Countdown Text.
          isTimerTextShown: true,

          // Handles the timer start.
          autoStart: true,

          // This Callback will execute when the Countdown Starts.
          onStart: () {
            // Here, do whatever you want
            print('Countdown Started');
          },

          // This Callback will execute when the Countdown Ends.
          onComplete: () {
            // Here, do whatever you want
            print('Countdown Ended');
            print(widget.counter);
            widget.counter++;
            widget._time = timealter(widget.counter);
            print(widget._time);
            widget._controller.restart(duration: widget._time);
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.width / 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: Container(
                  width: 74,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("pause", style: TextStyle(color: Colors.white)),
                      Icon(Icons.pause)
                    ],
                  ),
                ),
                onPressed: () => widget._controller.pause(),
                color: Colors.red),
            SizedBox(
              width: 5,
            ),
            MaterialButton(
                child: Container(
                  width: 74,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("resume", style: TextStyle(color: Colors.white)),
                      Icon(Icons.play_arrow_outlined)
                    ],
                  ),
                ),
                onPressed: () => widget._controller.resume(),
                color: Colors.green)
          ],
        ),
      ],
    ));
  }
}
