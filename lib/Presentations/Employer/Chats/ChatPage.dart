import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Routes/App_Routes.dart';
import '../../../Widgets/app_bar/appbar.dart';
import 'Controller/ChatController.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(
            title: 'Messages',
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image(image: AssetImage("assets/2.png")),
            ),
            action: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.Profile);
                    },
                    child: Icon(Icons.settings_outlined),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.h),
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
                  var messages = snapshot.data?.docs ?? [];
                  List<Widget> messageWidgets = [];
                  for (var message in messages.reversed) {
                    String messageText = message['text'];
                    Timestamp timestamp = message['createdAt'];
                    DateTime dateTime = timestamp.toDate();
                    String formattedDateTime =
                        '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
                    messageWidgets.add(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            messageText,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            formattedDateTime,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
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
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
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
