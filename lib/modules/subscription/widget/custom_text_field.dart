import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextInputType keyboardType;
  final TextEditingController ec;
  const CustomTextField({
    Key? key,
    required this.text,
    required this.ec,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ec,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: text,
      ),
    );
  }
}
