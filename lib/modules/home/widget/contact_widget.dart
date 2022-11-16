import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactWidget extends StatelessWidget {
  final String cellPhone;
  final String email;
  const ContactWidget({Key? key, required this.cellPhone, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        width: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Text(
              'Número:\n$cellPhone \n\nEmail:\n$email',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Fechar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Widget contactWidget(String cellPhone, String email) {
//   return AlertDialog(
//     content: Container(
//       height: 200,
//       width: 80,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//       ),
//       child: Column(
//         children: [
//           Text(
//             'Número:\n$cellPhone \n\nEmail:\n$email',
//             style: const TextStyle(fontSize: 20),
//           ),
//           const SizedBox(height: 15),
//           ElevatedButton(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
//             ),
//             onPressed: () {
//               Get.back();
//             },
//             child: const Text(
//               'Fechar',
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
