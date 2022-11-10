import 'package:flutter/material.dart';

class UserSelectorTypeWidget extends StatelessWidget {
  final bool selectedType;
  final Function(bool)? onChanged;
  const UserSelectorTypeWidget({required this.selectedType, required this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text("Empregador", style: TextStyle(fontSize: 20)),
        SizedBox(
          width: 10,
          child: Switch(
            value: selectedType,
            activeColor: Colors.amberAccent,
            onChanged: onChanged,
          ),
        ),
        const Text("Empregado", style: TextStyle(fontSize: 20))
      ],
    );
  }
}
