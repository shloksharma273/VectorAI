import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_ai/api/fetchData.dart';
import 'package:vector_ai/core/config/theme/app_colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  TextEditingController messageController = TextEditingController();
  String _apiResponse = '';
  final List<Map<String, String>> _messages = [];

  Future<void> _sendMessage() async {
    String msg = messageController.text ;
    messageController.clear();

    if(msg != ""){
      print("Message Sent");
      FetchData fetchData = FetchData(msg);
      String response = await fetchData.returnMessage(msg);
      setState(() {
        _apiResponse = response;
        _messages.add({"role": "user", "content": msg} as Map<String, String>);
        _messages.add({"role": "api", "content": _apiResponse} as Map<String, String>);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "VectorAI",
          style: TextStyle(
              color: AppColors.primaryText, fontFamily: 'Sedan', fontSize: 22),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              size: 15, color: AppColors.primaryText),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
                child: Container(
                  child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      final isUser = message['role'] == 'user';

                      return Align(
                        alignment: isUser ?Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10
                      ),
                      decoration: BoxDecoration(
                      color: isUser ? Colors.grey[300] : AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                      message['content']!,
                      style: TextStyle(color: isUser ? Colors.black : Colors.white),
                        ),
                      ),);
                    }),
                  ),
              )
              ),



            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xffF5F5F5),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: messageController,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "What Happened Cudu?",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.5)
                          )
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _sendMessage();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.primaryText,
                        size: 22,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
