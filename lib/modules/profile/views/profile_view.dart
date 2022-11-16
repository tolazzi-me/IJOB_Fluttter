import 'package:flutter/material.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/utils/constants.dart';

import '../../settings/documentacao.dart';
import '../../FiltroJobs/filtroJobs.dart';
import '../controllers/profile_controller.dart';
import '../widgets/photo_widget.dart';
import '../widgets/profile_appbar_widget.dart';

class ProfileView extends BaseView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return buildAppBarPerfil(context);
  }

  @override
  Widget body(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 30),
        PhotoWidget(
          imagePath: controller.user?.avatarUrl ?? Utils.defaultAvatarUrl,
          onClicked: () async {},
          onTap: () => controller.importImageProfile(),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            '${controller.user?.firstName} ${controller.user?.lastName}',
            style: const TextStyle(
              fontSize: 35,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.yellow, size: 27),
            Icon(Icons.star, color: Colors.yellow, size: 27),
            Icon(Icons.star, color: Colors.yellow, size: 27),
            Icon(Icons.star, color: Colors.yellow, size: 27),
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            controller.user?.about ?? 'Não existe bio cadastrada',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          height: 150,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 195, 194, 194), borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trabalhos',
                  style: TextStyle(fontSize: 23),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Trabalhos aceitos',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        color: Colors.grey,
                        height: 1,
                        width: double.infinity,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => filtroJobs())));
                        },
                        child: const Text(
                          'Filtro de trabalhos',
                          style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          height: 150,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 195, 194, 194), borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Configurações da conta',
                  style: TextStyle(fontSize: 23),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => documentacao())));
                        },
                        child: const Text(
                          'Documentação de segurança',
                          style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 1,
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
