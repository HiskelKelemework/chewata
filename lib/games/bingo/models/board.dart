import 'package:chewata/games/bingo/utils/index.dart';
import 'package:flutter/material.dart';

class Board {
  Board({required this.columns});
  final List<BoardColumn> columns;

  static Board fromJSON(Map<String, List<int>> json) {
    final columns = [
      for (final key in ['B', 'I', 'N', 'G', 'O'])
        BoardColumn(
          elements: [
            BoardCell(
              label: key,
              group: key,
              value: 0,
              clickable: false,
              bgColor: cellColor(key),
            ),
            for (final val in json[key]!)
              BoardCell(
                label: val == -1 ? 'Free' : val.toString(),
                value: val,
                group: key,
                clickable: val != -1,
                bgColor: val == -1 ? cellColor(key) : Colors.grey,
                clickedColor: cellColor(key),
              )
          ],
        )
    ];

    return Board(columns: columns);
  }
}

class BoardColumn {
  BoardColumn({required this.elements});
  List<BoardCell> elements;
}

class BoardCell {
  BoardCell({
    required this.label,
    required this.value,
    required this.group,
    this.bgColor = Colors.grey,
    this.clickedColor = Colors.grey,
    this.clickable = true,
    this.clicked = false,
  });

  final String label;
  final String group;
  final int value;
  final bool clickable;
  final bool clicked;
  final Color bgColor;
  final Color clickedColor;

  Color get color => clicked ? clickedColor : bgColor;

  BoardCell copyWith({required bool clicked}) {
    return BoardCell(
      label: label,
      value: value,
      group: group,
      clickable: clickable,
      clicked: clicked,
      bgColor: bgColor,
      clickedColor: clickedColor,
    );
  }
}
