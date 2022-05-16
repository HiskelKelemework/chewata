class Result {
  final String text;
  final bool exactCorrect;
  final bool outOfPlaceCorrect;
  final bool temporary;

  bool get incorrect => !(temporary || exactCorrect || outOfPlaceCorrect);

  Result({
    required this.text,
    this.temporary = false,
    this.exactCorrect = false,
    this.outOfPlaceCorrect = false,
  }) {
    assert(!(exactCorrect && outOfPlaceCorrect));
  }
}
