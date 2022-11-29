import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/modules/settings/views/settings_view.dart';

import '../../../routes/app_pages.dart';
import '../../FiltroJobs/filtroJobs.dart';
import '../../Suporte/suporte.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 80),
            // SizedBox(
            //   height: 35,
            //   width: 140,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: ((context) => filtroJobs())));
            //       // Get.toNamed(Routes.nomeTela);
            //     },
            //     child: const Text('Filtro de Jobs', style: TextStyle(color: Colors.black, fontSize: 14)),
            //     style: ButtonStyle(
            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            //         backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
            //   ),
            // ),
            // const SizedBox(height: 10),
            SizedBox(
              height: 35,
              width: 140,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: ((context) => premium())));
                  Get.toNamed(Routes.premium);
                },
                child: const Text('Premium', style: TextStyle(color: Colors.black, fontSize: 14)),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 35,
              width: 140,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => SettingsView())));
                },
                child: const Text('Configurações', style: TextStyle(color: Colors.black, fontSize: 14)),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 35,
              width: 140,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => suporte())));
                },
                child: const Text('Suporte', style: TextStyle(color: Colors.black, fontSize: 14)),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
