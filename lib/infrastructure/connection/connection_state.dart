part of 'connection_bloc.dart';

abstract class ConnState {}

class Connecting extends ConnState {}

class Connected extends ConnState {}

class Disconnected extends ConnState {}

class ErrorOccured extends ConnState {}
