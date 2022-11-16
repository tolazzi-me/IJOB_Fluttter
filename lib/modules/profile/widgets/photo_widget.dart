import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  final Image image;
  final VoidCallback onClicked;
  final VoidCallback onTap;

  const PhotoWidget({
    Key? key,
    required this.onClicked,
    required this.onTap,
    required this.image,
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
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          child: image,
          onTap: onTap,
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
