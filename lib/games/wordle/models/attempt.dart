import 'package:chewata/games/wordle/models/result.dart';

class Attempt {
  final List<String> letters;
  final String correctWord;
  final bool temporary;
  late final List<Result> results;

  Attempt({
    required this.letters,
    required this.correctWord,
    this.temporary = false,
  }) {
    results = _toResults(correctWord);
  }

  bool get correct {
    for (final result in results) {
      if (!result.exactCorrect) {
        return false;
      }
    }

    return true;
  }

  List<Result> _toResults(String correctWord) {
    if (temporary) {
      return letters.map((e) => Result(text: e, temporary: true)).toList();
    }

    assert(correctWord.length == letters.length);
    final correctLetterList = correctWord.split('');
    final correctLetterCount = <String, int>{};

    for (final letter in correctLetterList) {
      correctLetterCount[letter] = (correctLetterCount[letter] ?? 0) + 1;
    }

    final results = <Result?>[];

    for (int i = 0; i < letters.length; i++) {
      if (letters[i] == correctWord[i]) {
        results.add(Result(text: letters[i], exactCorrect: true));
        correctLetterCount[letters[i]] = correctLetterCount[letters[i]]! - 1;
        continue;
      }

      results.add(null);
    }

    for (int i = 0; i < results.length; i++) {
      if (results[i] != null) continue;

      final letterOutOfPlace = (correctLetterCount[letters[i]] ?? 0) > 0;
      results[i] = Result(
        text: letters[i],
        outOfPlaceCorrect: letterOutOfPlace,
      );
    }

    return results.map((e) => e!).toList();
  }
}
