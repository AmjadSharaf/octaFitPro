import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class messages_send extends StatelessWidget {
  const messages_send({
    super.key,
    required this.sizeWi,
    required this.chatController,
  });

  final double sizeWi;
  final TextEditingController chatController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.perm_media_outlined)),
        Gap(5),
        SizedBox(
          width: sizeWi / 1.3,
          child: TextField(
            controller: chatController,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration.collapsed(hintText: "send "),
          ),
        ),
        Gap(5),
        IconButton(onPressed: () {}, icon: Icon(Icons.send)),
      ],
    );
  }
}
