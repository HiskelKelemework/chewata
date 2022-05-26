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
}
