import 'package:chewata/games/index.dart';
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
                    gameTitle: "Wordle",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => WordleScreen()),
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
