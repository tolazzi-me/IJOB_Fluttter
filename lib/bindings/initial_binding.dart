import 'package:get/get.dart';
import 'package:ijob_app/modules/settings/controllers/settings_controller.dart';

import '../data/remote/service_remote_data_source.dart';
import 'remote_source_binding.dart';
import 'repository_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
    Get.put(SettingsController());
    Get.put(ServiceRemoteSourceImp());
  }
}
