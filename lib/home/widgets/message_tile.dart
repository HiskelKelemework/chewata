import 'package:chewata/home/index.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({Key? key, required this.msg}) : super(key: key);
  final Message msg;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment alignment;
    Color color = Colors.blue;

    switch (msg.senderType) {
      case Sender.own:
        alignment = MainAxisAlignment.end;
        color = Colors.blue;
        break;
      case Sender.other:
        alignment = MainAxisAlignment.start;
        color = Colors.blue;
        break;
      default:
        alignment = MainAxisAlignment.center;
        color = Colors.grey;
        break;
    }

    return Row(
      mainAxisAlignment: alignment,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(msg.text),
        ),
      ],
    );
  }
}
