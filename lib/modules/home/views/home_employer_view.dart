import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/modules/home/controller/employer/home_employer_controller.dart';
import 'package:ijob_app/modules/home/widget/contact_widget.dart';

import '../../../core/widget/custom_app_bar.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants.dart';
import '../../Empregador/addTrabalho.dart';
import '../widget/drawer.dart';

class HomeEmployerView extends BaseView<HomeEmployerController> {
  HomeEmployerView({Key? key}) : super(key: key);

  @override
  Widget? endDrawer() {
    return const DrawerMenu();
  }

  @override
  Widget? floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Get.to(addTrabalho());
      },
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
      backgroundColor: Colors.amberAccent,
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'IJOB',
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          onPressed: () => Get.toNamed(Routes.chat),
          icon: const Icon(
            Icons.chat,
            color: Colors.black,
            size: 35,
          ),
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Obx(() {
        if (controller.services.isEmpty) {
          return const Center(
            child: Text(
              'Você não tem serviços cadastrados',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.services.length,
          itemBuilder: ((context, index) {
            final service = controller.services[index];
            return ExpansionTile(
              initiallyExpanded: index == 0 ? true : false,
              title: Text(service.title, style: const TextStyle(fontSize: 20)),
              children: [
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 170,
                            height: 35,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Editar",
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 170,
                            height: 35,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Excluir",
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: service.likes!.length,
                        itemBuilder: ((context, serviceIndex) {
                          final like = service.likes![serviceIndex];
                          return InkWell(
                            onTap: () => Get.dialog(
                              ContactWidget(cellPhone: like.user!.cellPhone, email: like.user!.email),
                            ),
                            child: Container(
                              height: 170,
                              width: 170,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(image: NetworkImage(like.user!.avatarUrl ?? Utils.defaultAvatarUrl), fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${like.user!.firstName} ${like.user!.lastName}',
                                      style: const TextStyle(fontSize: 20, color: Colors.white),
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.star, color: Colors.yellow, size: 17),
                                        Icon(Icons.star, color: Colors.yellow, size: 17),
                                        Icon(Icons.star, color: Colors.yellow, size: 17),
                                        Icon(Icons.star, color: Colors.yellow, size: 17),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      // const SizedBox(height: 20),
                      // ElevatedButton(
                      //     onPressed: () {},
                      //     child: const Text("Visualizar mais", style: TextStyle(fontSize: 20, color: Colors.black)),
                      //     style: ButtonStyle(
                      //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      //         backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent))),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          }),
        );
      }),
    );
  }
}
