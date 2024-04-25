import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Widgets/app_bar/appbar.dart';
import '../../../core/utils/dimensions.dart';

class employeeChatScreen   extends StatefulWidget {
  @override
  _employeeChatScreenState createState() => _employeeChatScreenState();
}

class _employeeChatScreenState extends State<employeeChatScreen  > {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _sendMessage() {
    String messageText = _controller.text.trim();
    if (messageText.isNotEmpty) {
      _firestore.collection('messages').add({
        'text': messageText,
        'createdAt': Timestamp.now(),
      });
      _controller.clear();
    }
  }

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
                stream: _firestore
                    .collection('messages')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
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
                    controller: _controller,
                    enabled: false, // Make the TextField non-editable
                    decoration: InputDecoration(
                      hintText: 'Only Admin can send message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
