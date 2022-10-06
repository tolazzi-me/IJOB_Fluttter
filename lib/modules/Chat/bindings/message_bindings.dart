import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class MessageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseDatabase);
  }
}
