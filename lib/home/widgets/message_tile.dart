import 'package:chewata/home/index.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({Key? key, required this.msg}) : super(key: key);
  final Message msg;

  @override
  Widget build(BuildContext context) {
    Alignment alignment;
    Color color = Colors.blue;
    EdgeInsets margin = const EdgeInsets.only(bottom: 8);

    switch (msg.senderType) {
      case Sender.own:
        alignment = Alignment.centerRight;
        color = Colors.blue;
        margin = margin.copyWith(left: 50);
        break;
      case Sender.other:
        alignment = Alignment.centerLeft;
        color = Colors.blue;
        margin = margin.copyWith(right: 50);
        break;
      default:
        alignment = Alignment.center;
        color = Colors.grey;
        margin = margin.copyWith(left: 30, right: 30);
        break;
    }

    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            msg.senderType == Sender.server ? 100 : 20,
          ),
        ),
        child: Text(
          msg.text,
          textAlign: msg.senderType == Sender.server
              ? TextAlign.center
              : TextAlign.left,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
