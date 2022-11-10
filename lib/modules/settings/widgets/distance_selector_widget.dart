import 'package:flutter/material.dart';

class DistanceSelectorWidget extends StatelessWidget {
  final double distance;
  final Function(double)? onChanged;
  const DistanceSelectorWidget({required this.distance, required this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.add_location_rounded, size: 50),
        Column(
          children: [
            Text(
              "Distância máxima ${distance.toStringAsFixed(0)}",
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 260,
              child: Slider(
                value: distance,
                min: 1,
                max: 100,
                label: distance.toStringAsFixed(0),
                activeColor: Colors.amberAccent,
                onChanged: onChanged,
              ),
            ),
          ],
        )
      ],
    );
  }
}
