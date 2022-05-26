import 'package:chewata/home/index.dart';
import 'package:chewata/infrastructure/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaitingRoomScreen extends StatefulWidget {
  const WaitingRoomScreen({
    Key? key,
    required this.room,
  }) : super(key: key);

  final Room room;

  @override
  State<WaitingRoomScreen> createState() => _WaitingRoomScreenState();
}

class _WaitingRoomScreenState extends State<WaitingRoomScreen> {
  final msgController = TextEditingController();
  final scrollController = ScrollController();
  final messages = <Message>[];

  late final WaitingRoomBloc waitingRoomBloc;

  @override
  void initState() {
    final connBloc = BlocProvider.of<ConnectionBloc>(context);
    waitingRoomBloc = WaitingRoomBloc(connBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => waitingRoomBloc,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<WaitingRoomBloc, WaitingRoomState>(
                    buildWhen: (p, c) => c is NewMessage,
                    builder: (_, WaitingRoomState state) {
                      if (state is NewMessage) {
                        messages.add(state.msg);

                        Future.delayed(
                          const Duration(milliseconds: 100),
                          () {
                            scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeIn,
                            );
                          },
                        );
                      }

                      return ListView.builder(
                        itemCount: messages.length,
                        controller: scrollController,
                        itemBuilder: (_, int i) =>
                            MessageTile(msg: messages[i]),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: msgController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: _sendMsg,
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () => _sendMsg(msgController.text),
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendMsg(String msg) {
    if (msg.trim().isEmpty) return;
    waitingRoomBloc.add(SendMsg(msg.trim()));
    msgController.text = "";
  }
}
