import 'package:flutter/material.dart';

class DeleteServiceWidget extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  const DeleteServiceWidget({Key? key, required this.onCancel, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        width: 90,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Text(
              'Tem certeza que deseja realmente excluir esse serviço?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  ),
                  onPressed: onCancel,
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  ),
                  onPressed: onConfirm,
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
