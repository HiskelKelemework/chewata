import 'package:chewata/games/wordle/bloc/index.dart';
import 'package:chewata/games/wordle/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordleScreen extends StatelessWidget {
  WordleScreen({Key? key}) : super(key: key);
  final _boardBloc = BoardBloc("THERE");

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _boardBloc),
        BlocProvider(create: (_) => KeyboardBloc(_boardBloc)),
      ],
      child: Scaffold(
        body: Center(
          child: Column(
            children: const <Widget>[
              SizedBox(height: 50),
              Board(),
              SizedBox(height: 50),
              Keyboard(),
            ],
          ),
        ),
      ),
    );
  }
}
