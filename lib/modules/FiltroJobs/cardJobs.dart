import 'package:flutter/material.dart';

class buildTrabalho extends StatefulWidget {
  final jobImage;
  final jobName;

  const buildTrabalho({
    Key? key,
    required this.jobImage,
    required this.jobName,
  }) : super(key: key);

  @override
  State<buildTrabalho> createState() => _buildTrabalho();
}

class _buildTrabalho extends State<buildTrabalho> {
  @override
  Widget build(BuildContext context) => Container(
        height: 110,
        width: 160,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.jobImage), fit: BoxFit.cover),
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(widget.jobName,
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 5)
          ],
        ),
      );
}
