import 'dart:async';

import 'package:chat_gpt_api/app/chat_gpt.dart';
import 'package:flutter/material.dart';
import 'package:pfe_project/screen/widgets/child.pages/bottom.screens.dart/chat.message.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  ChatGPT? chatGPT;

  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _SendMessage() {
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "user",
    );

    setState(() {
      _messages.insert(0, message);
    });
    _controller.clear();
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: _controller,
          onSubmitted: (value) => _SendMessage(),
          decoration: InputDecoration.collapsed(hintText: "Send a message"),
        )),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => _SendMessage(),
        )
      ],
    ).px8();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                }),
          ),
          Container(
            decoration: BoxDecoration(
              color: context.cardColor,
            ),
            child: _buildTextComposer(),
          )
        ],
      ),
    ));
  }
}
