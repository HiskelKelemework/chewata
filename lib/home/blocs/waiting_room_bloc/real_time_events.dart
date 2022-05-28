part of 'waiting_room_bloc.dart';

abstract class ServerEvents {
  static const String gameJoined = "game:joined";
  static const String gameLeft = "game:left";
  static const String gameStarted = "game:started";
  static const String gameWaitingRoomMsg = "game:waitingroom:msg";
}

abstract class ClientEvents {
  static const String gameWaitingRoomMsg = "game:waitingroom:msg";
  static const String gameWaitingRoomJoin = "game:waitingroom:join";
  static const String gameWaitingRoomLeave = "game:waitingroom:leave";
}
