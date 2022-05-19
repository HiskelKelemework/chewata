part of 'call_board_bloc.dart';

abstract class CallBoardState {}

class CallBoardIdle extends CallBoardState {}

class CallMade extends CallBoardState {
  final Call call;
  CallMade({required this.call});
}

class CallEnded extends CallBoardState {}
