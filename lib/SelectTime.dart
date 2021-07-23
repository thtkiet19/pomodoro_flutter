import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SelectTime extends StatefulWidget {
  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  int _currentHours = 0;
  int _currentMinutes = 45;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
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
                    onChanged: (value) => setState(() => _currentHours = value),
                  ),
                  /*    Divider(color: Colors.grey, height: 32),
                  SizedBox(height: 16),
                  Text('Horizontal', style: Theme.of(context).textTheme.headline6),
                  NumberPicker(
                    value: _currentHorizontalIntValue,
                    minValue: 0,
                    maxValue: 100,
                    step: 10,
                    itemHeight: 100,
                    axis: Axis.horizontal,
                    onChanged: (value) =>
                        setState(() => _currentHorizontalIntValue = value),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black26),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => setState(() {
                          final newValue = _currentHorizontalIntValue - 10;
                          _currentHorizontalIntValue = newValue.clamp(0, 100);
                        }),
                      ),
                      Text('Current horizontal int value: $_currentHorizontalIntValue'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => setState(() {
                          final newValue = _currentHorizontalIntValue + 20;
                          _currentHorizontalIntValue = newValue.clamp(0, 100);
                        }),
                      ),
                    ],
                  ),*/
                ],
              ),
              Column(
                children: <Widget>[
                  Text('Minutes', style: TextStyle(color: Colors.white)),
                  NumberPicker(
                    textStyle: TextStyle(color: Colors.white),
                    value: _currentMinutes,
                    minValue: 0,
                    maxValue: 60,
                    step: 1,
                    haptics: true,
                    onChanged: (value) =>
                        setState(() => _currentMinutes = value),
                  ),
                ],
              )
            ],
          ),
          IconButton(
              onPressed: search(),
              icon: Icon(
                Icons.add,
                color: Colors.lightBlue,
                size: 30,
              ))
        ],
      ),
    );
  }
}

search() {
  print('search');
}
