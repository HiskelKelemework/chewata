part of 'waiting_room_bloc.dart';

abstract class WaitingRoomState {}

class RoomIdle extends WaitingRoomState {}

class JoinedWaitingRoom extends WaitingRoomState {}

class JoinedGame extends WaitingRoomState {}

class LeftGame extends WaitingRoomState {}

class NewMessage extends WaitingRoomState {
  final Message msg;
  NewMessage({required this.msg});
}

class GameStarted extends WaitingRoomState {}
