import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class employeeChatController extends GetxController {
  final TextEditingController controller = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void sendMessage() {
    String messageText = controller.text.trim();
    if (messageText.isNotEmpty) {
      firestore.collection('messages').add({
        'text': messageText,
        'createdAt': Timestamp.now(),
      });
      controller.clear();
    }
  }

  Stream<QuerySnapshot> getMessagesStream() {
    return firestore
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
