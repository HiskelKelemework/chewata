part of 'connection_bloc.dart';

abstract class ConnEvent {}

class Connect extends ConnEvent {}

class Disconnect extends ConnEvent {}

class _Connecting extends ConnEvent {}

class _Connected extends ConnEvent {}

class _Disconnected extends ConnEvent {}

class _ConnectionError extends ConnEvent {}
