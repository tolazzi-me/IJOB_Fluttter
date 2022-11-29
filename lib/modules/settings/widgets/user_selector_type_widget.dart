import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSelectorTypeWidget extends StatelessWidget {
  final int selectedUserType;
  final Function(Object?)? onSelect;
  const UserSelectorTypeWidget({required this.selectedUserType, required this.onSelect, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: RadioListTile<int>(
              contentPadding: const EdgeInsets.all(0),
              value: 0,
              groupValue: selectedUserType,
              onChanged: onSelect,
              title: const Text(
                'Empregado',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: RadioListTile<int>(
              contentPadding: const EdgeInsets.all(0),
              value: 1,
              groupValue: selectedUserType,
              onChanged: onSelect,
              title: const Text(
                'Empregador',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
