import 'package:chewata/games/wordle/bloc/index.dart';
import 'package:chewata/games/wordle/models/index.dart';
import 'package:chewata/games/wordle/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordleScreen extends StatelessWidget {
  WordleScreen({Key? key}) : super(key: key);
  final _boardBloc = BoardBloc(WordsDB());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _boardBloc),
        BlocProvider(create: (_) => KeyboardBloc(_boardBloc)),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("Wordle", style: TextStyle(fontSize: 28)),
                  ),
                  Board(),
                  SizedBox(height: 50),
                  Keyboard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
