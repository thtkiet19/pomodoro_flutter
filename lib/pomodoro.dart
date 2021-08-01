import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class pomodoro extends StatefulWidget {
  const pomodoro({Key? key}) : super(key: key);

  @override
  _pomodoroState createState() => _pomodoroState();
}

class _pomodoroState extends State<pomodoro> {
  Map data = {};
  late Color bkColor;
  @override
  void initState() {
    bkColor = Colors.blueGrey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text('Pomodoro'),
        ),
        centerTitle: true,
      ),
      body: Container(
          color: bkColor,
          child: Center(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ListTile(
                    title: Text('Background\'s Color '),
                    subtitle: Text(
                      '${ColorTools.nameThatColor(bkColor)}',
                    ),
                    trailing: ColorIndicator(
                        hasBorder: true,
                        width: 40,
                        height: 40,
                        borderRadius: 3,
                        borderColor: Color(bkColor.value * 2),
                        color: bkColor,
                        elevation: 1,
                        onSelectFocus: false,
                        onSelect: () async {
                          // Wait for the dialog to return color selection result.
                          final Color newColor = await showColorPickerDialog(
                            // The dialog needs a context, we pass it in.
                            context,
                            // We use the dialogSelectColor, as its starting color.
                            bkColor,
                            title: Text('ColorPicker',
                                style: Theme.of(context).textTheme.headline6),
                            width: 40,
                            height: 40,
                            spacing: 0,
                            runSpacing: 0,
                            borderRadius: 0,
                            wheelDiameter: 165,
                            enableOpacity: true,
                            showColorCode: true,
                            colorCodeHasColor: true,
                            pickersEnabled: <ColorPickerType, bool>{
                              ColorPickerType.wheel: true,
                            },
                            copyPasteBehavior:
                                const ColorPickerCopyPasteBehavior(
                              copyButton: true,
                              pasteButton: true,
                              longPressMenu: true,
                            ),
                            actionButtons: const ColorPickerActionButtons(
                              okButton: true,
                              closeButton: true,
                              dialogActionButtons: false,
                            ),
                            constraints: const BoxConstraints(
                                minHeight: 480, minWidth: 320, maxWidth: 320),
                          );
                          // We update the dialogSelectColor, to the returned result
                          // color. If the dialog was dismissed it actually returns
                          // the color we started with. The extra update for that
                          // below does not really matter, but if you want you can
                          // check if they are equal and skip the update below.
                          setState(() {
                            bkColor = newColor;
                          });
                        }),
                  ),
                ),
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
  /// Color in the rim of the circle
  late Color rimColor; // Color for picker using color select dialog.

  /// Color in the center of the circle
  late Color mainColor;

  /// background color
  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);

  final Map<ColorSwatch<Object>, String> colorsNameMap =
      <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };
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
  void initState() {
    rimColor = const Color(0xFFA239CA);
    mainColor = Colors.teal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget._time = timealter(widget.counter);
    print(widget._time);
    return Container(
        child: Column(
      children: [
        /*SizedBox(
          height: MediaQuery.of(context).size.width / 3,
        ),*/
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.3,
              child: ListTile(
                title: const Text('Rim\'s Color'),
                subtitle: Text(
                  '${ColorTools.nameThatColor(rimColor)}',
                ),
                trailing: ColorIndicator(
                    width: 40,
                    height: 40,
                    borderRadius: 0,
                    color: rimColor,
                    elevation: 1,
                    onSelectFocus: false,
                    onSelect: () async {
                      // Wait for the dialog to return color selection result.
                      final Color newColor = await showColorPickerDialog(
                        // The dialog needs a context, we pass it in.
                        context,
                        // We use the dialogSelectColor, as its starting color.
                        rimColor,
                        title: Text('ColorPicker',
                            style: Theme.of(context).textTheme.headline6),
                        width: 40,
                        height: 40,
                        spacing: 0,
                        runSpacing: 0,
                        borderRadius: 0,
                        wheelDiameter: 165,
                        enableOpacity: true,
                        showColorCode: true,
                        colorCodeHasColor: true,
                        pickersEnabled: <ColorPickerType, bool>{
                          ColorPickerType.wheel: true,
                        },
                        copyPasteBehavior: const ColorPickerCopyPasteBehavior(
                          copyButton: true,
                          pasteButton: true,
                          longPressMenu: true,
                        ),
                        actionButtons: const ColorPickerActionButtons(
                          okButton: true,
                          closeButton: true,
                          dialogActionButtons: false,
                        ),
                        constraints: const BoxConstraints(
                            minHeight: 480, minWidth: 320, maxWidth: 320),
                      );
                      // We update the dialogSelectColor, to the returned result
                      // color. If the dialog was dismissed it actually returns
                      // the color we started with. The extra update for that
                      // below does not really matter, but if you want you can
                      // check if they are equal and skip the update below.
                      setState(() {
                        rimColor = newColor;
                      });
                    }),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.3,
              child: ListTile(
                title: const Text('Main\'s Color'),
                subtitle: Text(
                  '${ColorTools.nameThatColor(mainColor)}',
                ),
                trailing: ColorIndicator(
                    width: 40,
                    height: 40,
                    borderRadius: 0,
                    color: mainColor,
                    elevation: 1,
                    onSelectFocus: false,
                    onSelect: () async {
                      // Wait for the dialog to return color selection result.
                      final Color newColor = await showColorPickerDialog(
                        // The dialog needs a context, we pass it in.
                        context,
                        // We use the dialogSelectColor, as its starting color.
                        mainColor,
                        title: Text('ColorPicker',
                            style: Theme.of(context).textTheme.headline6),
                        width: 40,
                        height: 40,
                        spacing: 0,
                        runSpacing: 0,
                        borderRadius: 0,
                        wheelDiameter: 165,
                        enableOpacity: true,
                        showColorCode: true,
                        colorCodeHasColor: true,
                        pickersEnabled: <ColorPickerType, bool>{
                          ColorPickerType.wheel: true,
                        },
                        copyPasteBehavior: const ColorPickerCopyPasteBehavior(
                          copyButton: true,
                          pasteButton: true,
                          longPressMenu: true,
                        ),
                        actionButtons: const ColorPickerActionButtons(
                          okButton: true,
                          closeButton: true,
                          dialogActionButtons: false,
                        ),
                        constraints: const BoxConstraints(
                            minHeight: 480, minWidth: 320, maxWidth: 320),
                      );
                      // We update the dialogSelectColor, to the returned result
                      // color. If the dialog was dismissed it actually returns
                      // the color we started with. The extra update for that
                      // below does not really matter, but if you want you can
                      // check if they are equal and skip the update below.
                      setState(() {
                        mainColor = newColor;
                      });
                    }),
              ),
            ),
          ],
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
          fillColor: rimColor,

          // Filling Gradient for Countdown Widget.
          fillGradient: null,

          // Background Color for Countdown Widget.
          backgroundColor: mainColor,

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
            widget._controller.restart(duration: widget._time * 60);
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
