import 'package:get/get.dart';

import 'remote_source_binding.dart';
import 'repository_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
  }
}
