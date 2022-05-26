part of 'waiting_room_bloc.dart';

abstract class WaitingRoomEvent {}

class _JoinedGame extends WaitingRoomEvent {}

class _LeftGame extends WaitingRoomEvent {}

class _NewMessage extends WaitingRoomEvent {
  final Message msg;
  _NewMessage({required this.msg});
}

class _GameStarted extends WaitingRoomEvent {}

class JoinGame extends WaitingRoomEvent {}

class SendMsg extends WaitingRoomEvent {
  final String msg;
  SendMsg(this.msg);
}
