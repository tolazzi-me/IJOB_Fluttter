import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/model/message_model.dart';

class MessageController extends BaseController {
  final _messages = <Message>[].obs;
  final _limit = 20.obs;
  final _incrementalLimit = 20.obs;
  final _db = FirebaseFirestore.instance;

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMessages(
      String groupChatId) async {
    return _db
        .doc('messages')
        .collection(groupChatId)
        .limit(_limit.value)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
