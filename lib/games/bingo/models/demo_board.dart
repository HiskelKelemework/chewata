import 'package:chewata/games/bingo/index.dart';

final demoBoard = Board.fromJSON({
  'B': shuffledBingo(1, 16, 5),
  'I': shuffledBingo(16, 31, 5),
  'N': addFreeTile(shuffledBingo(31, 46, 5)),
  'G': shuffledBingo(46, 61, 5),
  'O': shuffledBingo(61, 76, 5),
});
