import 'package:chewata/games/bingo/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.cellData,
    required this.row,
    required this.col,
  }) : super(key: key);

  final BoardCell cellData;
  final int row;
  final int col;

  @override
  Widget build(BuildContext context) {
    final boardBloc = BlocProvider.of<BoardBloc>(context);

    return InkWell(
      onTap: cellData.clickable
          ? () {
              boardBloc.add(CellClicked(row: row, col: col));
            }
          : null,
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: cellData.color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            cellData.label,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
