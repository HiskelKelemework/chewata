class Call {
  final String group;
  final int val;

  Call({required this.group, required this.val});

  bool equals(Call call) {
    return group == call.group && val == call.val;
  }
}
