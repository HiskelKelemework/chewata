import 'package:chewata/games/bingo/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallBoard extends StatelessWidget {
  CallBoard({Key? key}) : super(key: key);
  final List<Call> _calls = [];
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final boardBloc = BlocProvider.of<BoardBloc>(context);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: BlocBuilder<CallBoardBloc, CallBoardState>(
        bloc: boardBloc.callBoardBloc,
        buildWhen: (_, c) => c is CallMade,
        builder: (_, CallBoardState state) {
          if (state is CallMade) {
            final newCall = state.call;
            _calls.add(newCall);

            Future.delayed(const Duration(microseconds: 100), () {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            });
          }

          return ListView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            children: _calls
                .map(
                  (c) => Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: cellColor(c.group),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${c.group}-${c.val}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
