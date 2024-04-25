import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Widgets/app_bar/appbar.dart';
import '../../../core/utils/dimensions.dart';
import 'Controller/ChatController.dart';

class employeeChatScreen extends StatelessWidget {
  final employeeChatController chatController = Get.put(employeeChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(
            title: 'Admin Messages',
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image(image: AssetImage("assets/2.png")),
            ),
            action: null,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: StreamBuilder(
                stream: chatController.getMessagesStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  var messages = snapshot.data?.docs.reversed.toList() ?? [];
                  List<Widget> messageWidgets = [];
                  for (var message in messages) {
                    String messageText = message['text'];
                    Timestamp timestamp = message['createdAt'];
                    DateTime dateTime = timestamp.toDate();
                    String formattedDateTime =
                        '${dateTime.day}/${dateTime.month}/${dateTime.year}, ${dateTime.hour}:${dateTime.minute}';
                    messageWidgets.add(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formattedDateTime,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Text(
                              messageText,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    );
                  }
                  return ListView(
                    children: messageWidgets,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: chatController.controller,
                    enabled: false, // Make the TextField non-editable
                    decoration: InputDecoration(
                      hintText: 'Only Admin can send message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: chatController.sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
