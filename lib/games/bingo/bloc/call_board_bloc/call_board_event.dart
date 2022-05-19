part of 'call_board_bloc.dart';

abstract class CallBoardEvent {}

class MakeCall extends CallBoardEvent {
  final Call call;
  MakeCall({required this.call});
}

class EndCall extends CallBoardEvent {}
