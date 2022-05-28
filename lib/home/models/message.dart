enum Sender { own, server, other }

class Message {
  final String senderId;
  final Sender senderType;
  final String text;

  Message({
    required this.text,
    required this.senderType,
    required this.senderId,
  });

  factory Message.fromJSON(Map<String, dynamic> json) {
    return Message(
      text: json["text"]!,
      senderType: json["senderId"] == "server" ? Sender.server : Sender.other,
      senderId: json["senderId"]!,
    );
  }
}
