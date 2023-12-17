import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Function onPlayPressed;
  final Function onStopPressed;
  final Function(double) onSpeedChanged;
  final double speechRate;

  const BottomBar({
    super.key,
    required this.onPlayPressed,
    required this.onStopPressed,
    required this.onSpeedChanged,
    required this.speechRate,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              onPlayPressed();
            },
          ),
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: () {
              onStopPressed();
            },
          ),
          DropdownButton<double>(
            value: speechRate,
            onChanged: (double? newValue) {
              onSpeedChanged(newValue!);
            },
            items: <double>[0.5, 1.0, 1.5, 2.0]
                .map<DropdownMenuItem<double>>((double value) {
              return DropdownMenuItem<double>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
