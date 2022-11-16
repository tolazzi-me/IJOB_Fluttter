import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/modules/settings/controllers/settings_controller.dart';

import '../widgets/distance_selector_widget.dart';
import '../widgets/user_selector_type_widget.dart';

class SettingsView extends BaseView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'Configurações',
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Column(
        children: [
          const Text("Tipo de conta", style: TextStyle(fontSize: 25)),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => UserSelectorTypeWidget(
                  selectedType: controller.userActiveTypeSelected,
                  onChanged: (bool value) {
                    controller.changeUserActiveType();
                    controller.userActiveTypeSelected = value;
                  },
                ),
              ),
              const SizedBox(height: 40),
              Obx(
                () => DistanceSelectorWidget(
                  distance: controller.distance,
                  onChanged: (_value) {
                    controller.distance = _value;
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                    child: IconButton(
                      icon: const Icon(Icons.first_page,
                          size: 60, color: Colors.black),
                      onPressed: () {
                        controller.logout();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        controller.logout();
                      },
                      child: const Text(
                        "Sair da conta",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Icon(Icons.cancel, size: 50),
                  ),
                  Text("Excluir conta", style: TextStyle(fontSize: 20))
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              height: 40,
              width: 170,
              child: ElevatedButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 214, 62))),
                  child: const Text(
                    'Redefinir',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
