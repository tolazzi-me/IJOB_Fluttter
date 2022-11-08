import 'dart:io';

import 'package:flutter/material.dart';

class widgetFoto extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const widgetFoto({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildFoto(),
          Positioned(bottom: 0, right: 4, child: buildEditar(color)),
        ],
      ),
    );
  }

  Widget buildFoto() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditar(Color color) => buildCirculo(
        color: Colors.black,
        all: 1,
        child: buildCirculo(
          color: Colors.white,
          all: 8,
          child: const Icon(Icons.edit, size: 25),
        ),
      );

  Widget buildCirculo({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
