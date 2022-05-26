import 'package:chewata/home/index.dart';
import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  Widget _buildGameLink({
    required String gameTitle,
    required Function() onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        children: [
          const Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: CircleAvatar(),
            ),
          ),
          Text(gameTitle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Games",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildGameLink(
                    gameTitle: "Bingo",
                    onPressed: () {
                      Scaffold.of(context).showBottomSheet(
                        (_) => WaitingRoomsSheet(
                          rooms: [
                            Room(id: "bingo:5", name: "Bale 5"),
                            Room(id: "bingo:10", name: "Bale 10"),
                            Room(id: "bingo:15", name: "Bale 15"),
                            Room(id: "bingo:25", name: "Bale 25"),
                            Room(id: "bingo:50", name: "Bale 50"),
                            Room(id: "bingo:100", name: "Bale 100"),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  _buildGameLink(
                    gameTitle: "Wordle",
                    onPressed: () {
                      Scaffold.of(context).showBottomSheet(
                        (_) => WaitingRoomsSheet(
                          rooms: [
                            Room(id: "wordle:5", name: "Bale 5"),
                            Room(id: "wordle:10", name: "Bale 10"),
                            Room(id: "wordle:15", name: "Bale 15"),
                            Room(id: "wordle:25", name: "Bale 25"),
                            Room(id: "wordle:50", name: "Bale 50"),
                            Room(id: "wordle:100", name: "Bale 100"),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
